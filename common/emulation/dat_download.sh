rm -rf dat/raw/redump
mkdir -p dat/raw/redump
cd dat/raw/redump
curl http://redump.org/downloads | xmllint --format --html - | sed -En 's/.*\"(\/datfile\/.*?)\".*/\1/p' | xargs -rn1 -I{} curl -OJL http://redump.org{}
7z x "*.zip"
rm *.zip

cd ..
mkdir nointro
cd nointro

cd ../../
mkdir merged
cd merged
