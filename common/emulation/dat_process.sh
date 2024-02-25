rm -rf dat/merged
mkdir -p dat/merged
find dat/raw -name \*.dat | python dat_process.py --bins nes snes n64 gamecube gb gbc gba atari2600 atari5200 atari7800 atarilynx jaguar gamegear mastersystem megadrive sega32x --output dat/merged

cd retool
rm -rf ../dat/processed
mkdir -p ../dat/processed
find ../dat/merged -name \*.dat | xargs -rn1 -I{} python retool.py --exclude abcdpPrv --originalheader --output ../dat/processed {}
cd ..

cd dat/processed
ls | sed -En 's/^(\w+)\s*\(.*\(Retool.*\.dat/"\0" "\1.dat"/p' | xargs -rn2 mv -n
cd ../..

# cd ../dat
# rm -rf tmp merged
# mkdir tmp
# mkdir merged
# cp processed/*.dat tmp/
# ls tmp/*.dat | sed '/Non-Redump/d' | sed -En 's/.*?\/(.*)\s+\([ 0-9-]*\)\s*\(Retool.*\.dat/"\0" "merged\/\1.dat"/p' | xargs -rn2 mv -n
