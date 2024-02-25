from pathlib import Path
import re
import difflib
import lxml.etree as ET
import argparse
import sys
import fileinput
import logging as log
import os
import itertools
import datetime

valid_names = [ 'atarilynx', 'sega32xjp', 'x1', 'vectrex', 'primehacks', 'trs-80', 'videopac', 'uzebox', 'gamecom', 'atarijaguarcd', 'cdimono1', 'wasm4', 'snesna', 'zxspectrum', 'sufami', 'xbox', 'atari7800', 'apple2gs', 'pokemini', 'pico8', 'astrocde', 'megadrivejp', 'sgb', 'tg16', 'tanodragon', 'mugen', 'arduboy', 'pc88', 'vic20', 'arcade', 'fds', 'naomigd', 'fba', 'model2', 'ngp', 'vsmile', 'cps2', 'coco', 'tg-cd', 'steam', 'oric', 'snes', 'gamecube', 'msxturbor', 'moto', 'saturn', 'zmachine', 'msx', 'quake', 'megaduck', 'cavestory', 'psp', 'daphne', 'dragon32', 'pcenginecd', 'apple2', 'atari800', 'msx1', 'intellivision', 'moonlight', 'atarijaguar', 'mastersystem', 'scummvm', 'megadrive', 'wii', 'neogeocdjp', 'fmtowns', 'n64dd', '3do', 'epic', 'neogeo', 'macintosh', 'kodi', 'cps', 'cloud', 'atari2600', 'mame', 'ps2', 'atarixe', 'gameandwatch', 'segacd', 'amiga', 'dreamcast', 'multivision', 'odyssey2', 'gx4000', 'mame-mame4all', 'famicom', 'virtualboy', 'colecovision', 'lutro', 'cdtv', 'tic80', 'neogeocd', 'megacdjp', 'x68000', 'psx', 'atari5200', 'ports', 'easyrpg', 'xbox360', 'nds', 'ti99', 'sega32x', 'sega32xna', 'amigacd32', 'j2me', 'mame-advmame', 'symbian', 'openbor', 'c16', 'lcdgames', 'gbc', 'arcadia', 'chailove', 'mess', 'wiiu', 'palm', 'amiga1200', 'stratagus', 'naomi', 'ngpc', 'supergrafx', 'ps3', 'gb', 'sneshd', 'to8', 'atarist', 'sg-1000', 'satellaview', 'channelf', 'cps1', 'gamegear', 'amiga600', 'android', 'amstradcpc', 'saturnjp', 'pc98', 'megacd', 'bbcmicro', 'flash', 'cps3', 'ps4', 'genesis', 'pc', 'n64', 'nes', 'zx81', 'supervision', 'switch', 'atomiswave', 'samcoupe', 'spectravideo', 'ags', 'gba', 'model3', 'wonderswancolor', 'sfc', 'pv1000', 'c64', 'psvita', 'solarus', 'crvision', 'pcengine', 'pcfx', '3ds', 'remoteplay', 'lutris', 'doom', 'msx2', 'wonderswan', 'dos', 'desktop', 'fbneo']


is_stdin = not sys.stdin.isatty()
parser = argparse.ArgumentParser(prog='mergedat', description='Merges datfiles and bins them according to a list output names')
parser.add_argument('datfiles', nargs='+' if sys.stdin.isatty() else '*', type=argparse.FileType('r'), default=[open(f.strip()) for f in fileinput.input('-')] if is_stdin else '', help='datfiles to be merged')
parser.add_argument('--output', help='output folder', default='dat/merged')
parser.add_argument('--bins', nargs='+', default=valid_names, help='bins to assort files to')
parser.add_argument('-v', '--verbose', action="count", default=0, help="verbosity level")
args = parser.parse_args()
log.basicConfig(level=[log.FATAL, log.ERROR, log.WARNING, log.INFO, log.DEBUG][min(args.verbose+2, 4)], format="{levelname:>7}:{lineno}: {message}", style='{')
log.debug(args)




bins = dict()
for name in args.bins:
    bins[name] = list()

def split_name(name, splits):
    parts = name
    for split in splits:
        parts = parts.replace(split, ';')
    parts=[p.strip() for p in parts.split(';')]
    combinations = list(itertools.chain.from_iterable([[list(dict.fromkeys(t)) for t in itertools.product(parts, repeat=i)] for i in range(1,len(parts)+2)]))
    combinations = [' '.join(list(dict.fromkeys(c))) for c in combinations]
    combinations += list(itertools.chain.from_iterable([c.split(' ') for c in combinations]))
    combinations = list(dict.fromkeys(sorted(combinations, key=len,reverse=True)))
    # log.error(combinations)
    return combinations

def process_name(name):
    # name=re.sub(r'.*/', '', f'{name}')
    name=re.sub(r'\.[^\.]+$', '', name)
    name=re.sub(r'\([ 0-9-]*\)', '', name)
    name=re.sub(r'\s*-\s*(bios\s*)?datfile\s*', '', name, flags=re.IGNORECASE)
    name=re.sub(r'\([^)]*\)', '', name)
    name=re.sub(r'\s*(unofficial|non-redump|source code)\s*-\s*', '', name, flags=re.IGNORECASE)
    name=re.sub(r'(\s{2,}|^\s*|\s*$)', '', name)
    return name

def trymatch(names, bins):
    matches = []
    for name in names:
        matches=difflib.get_close_matches(name.lower(), bins, cutoff=1)
        name=re.sub(r'[ -+]', '', name)
        matches+=difflib.get_close_matches(name.lower(), bins, cutoff=1)
        name=re.sub(r'[a-z -]', '', name)
        matches+=difflib.get_close_matches(name.lower(), bins, cutoff=1)
        if matches:
            break
    return matches


for file in args.datfiles:
    log.info(f'Reading file {file.name}')
    try:
        root = ET.fromstring(file.read())
    except:
        log.error(f'unable to parse file {file.name}, skipping')
        continue

    attr = dict(
        file = file,
        root = root,
        filename = os.path.basename(file.name),
        name = root.find('.//name').text,
        description = root.find('.//description').text,
        romextension = list(dict.fromkeys([Path(rom.get('name')).suffix[1:None] for rom in root.findall('.//rom')]))
    )

    attr['filename_clean']=process_name(attr['filename'])
    attr['filename_splits']=split_name(attr['filename_clean'], ['-', '&', '+'])

    for key, val in attr.items():
        log.debug(f'{key}: {val}')

    matches = trymatch(attr['filename_splits'], args.bins)

    # print(f'Unable to match: {filename_clean} {matches}')
    if matches:
        bins[matches[0]].append(attr)
    else:
        log.error(f'Unable to match: {attr["filename"]}')


for systemname, names in bins.items():
    header_nodes = list()
    game_nodes = list()

    if names:
        for name in names:
            log.warning(f'{systemname} -> {name["filename"]}')
            root = name['root']
            for node in root.findall('header'):
                header_nodes.append(node)
            for node in root.findall('game'):
                game_nodes.append(node)


        root = ET.Element("datafile")
        header_node = ET.SubElement(root, "header")
        ET.SubElement(header_node, "name").text = systemname
        ET.SubElement(header_node, "description").text = header_nodes[0].find('description').text
        ET.SubElement(header_node, "version").text = datetime.datetime.today().strftime('%Y-%m-%d %H-%M-%S')
        ET.SubElement(header_node, "date").text = datetime.datetime.today().strftime('%Y-%m-%d %H-%M-%S')
        ET.SubElement(header_node, "author").text = "Autogenerated based on Redump, No-Intro and Retool"
        # ET.SubElement(header_node, "homepage").text = "none"
        # ET.SubElement(header_node, "url").text = "name..."

        for node in game_nodes:
            for attr in node.attrib.keys():
                if attr not in ['name']:
                    del node.attrib[attr]

            children = node.findall('./')
            for child in children:
                if child.tag not in ['rom', 'description', 'category']:
                    node.remove(child)
                
            root.append(node)

        tree = ET.ElementTree(root)
        ET.indent(tree, space="\t", level=0)


        Path(args.output).mkdir(parents=True, exist_ok=True)
        tree.write(f"{args.output}/{systemname}.dat", encoding="utf-8", xml_declaration=True)
        # break