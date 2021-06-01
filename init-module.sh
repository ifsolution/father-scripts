#!/bin/bash -e

set -e

NAME=$1

if [ -z $NAME ]; then
    echo "Missing module name"
    exit 1
fi

git clone git@github.com:ifsolution/module-structure-template.git

rm -rf module-structure-template/.git
cp -r module-structure-template/ .
rm -rf module-structure-template

echo "👉 Renmame podspecs"

sed -i '' "s/__DAD__/${NAME}/g" "__DAD__.podspec"
sed -i '' "s/__DAD__/${NAME}/g" "__DAD__IO.podspec"

mv __DAD__.podspec "${NAME}.podspec"
mv __DAD__IO.podspec "${NAME}IO.podspec"

echo "👉 Renmame Module Integration"

sed -i '' "s/__DAD__/${NAME}/g" "Sources/Integration/__DAD__BoardProducer.swift"
sed -i '' "s/__DAD__/${NAME}/g" "Sources/Integration/__DAD__ModuleLoader.swift"
sed -i '' "s/__DAD__/${NAME}/g" "Sources/Integration/__DAD__ModulePlugin.swift"

mv "Sources/Integration/__DAD__BoardProducer.swift" "Sources/Integration/${NAME}BoardProducer.swift"
mv "Sources/Integration/__DAD__ModuleLoader.swift" "Sources/Integration/${NAME}ModuleLoader.swift"
mv "Sources/Integration/__DAD__ModulePlugin.swift" "Sources/Integration/${NAME}ModulePlugin.swift"

echo "👉 Renmame IO Interface"

sed -i '' "s/__DAD__/${NAME}/g" "IO/__DAD__IOInterface.swift"

NO_PREFIX_NAME=$(sed "s/Dad//g" <<<"$NAME")
VAR="$(tr '[:upper:]' '[:lower:]' <<<${NO_PREFIX_NAME:0:1})${NO_PREFIX_NAME:1}"
sed -i '' "s/__dad__/${VAR}/g" "IO/__DAD__IOInterface.swift"

mv "IO/__DAD__IOInterface.swift" "IO/${NAME}IOInterface.swift"

echo "✅ Initialized $NAME module successfully!"
