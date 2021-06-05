#!/bin/bash -e

set -e

NAME=$1
PREFIX=$2

if [ -z $NAME ]; then
    echo "Missing module name"
    exit 1
fi

if [ -z $PREFIX ]; then
    PREFIX="Dad"
fi

echo "● Module name set to $NAME"
echo "● Module prefix set to $PREFIX"

git clone git@github.com:ifsolution/module-structure-template.git

rm -rf module-structure-template/.git
cp -r module-structure-template/ .
rm -rf module-structure-template

echo "👉 Renmame podspecs"

sed -i '' "s/__DAD__/${NAME}/g" "__DAD__.podspec"
sed -i '' "s/__DAD__/${NAME}/g" "__DAD__IO.podspec"

mv __DAD__.podspec "${NAME}.podspec"
mv __DAD__IO.podspec "${NAME}IO.podspec"

echo "👉 Renmame IO Interface"

NO_PREFIX_NAME=$(sed "s/$PREFIX//g" <<<"$NAME")

sed -i '' "s/___VARIABLE_moduleName___/${NO_PREFIX_NAME}/g" "IO/___VARIABLE_moduleName___IOInterface.swift"

VAR="$(tr '[:upper:]' '[:lower:]' <<<${NO_PREFIX_NAME:0:1})${NO_PREFIX_NAME:1}"
sed -i '' "s/<#mod name var#>/${VAR}/g" "IO/___VARIABLE_moduleName___IOInterface.swift"

mv "IO/___VARIABLE_moduleName___IOInterface.swift" "IO/${NO_PREFIX_NAME}IOInterface.swift"

echo "👉 Renmame Module Integration"

sed -i '' "s/___VARIABLE_moduleName___/${NO_PREFIX_NAME}/g" "Sources/Integration/___VARIABLE_moduleName___BoardProducer.swift"
# sed -i '' "s/__DAD__/${NO_PREFIX_NAME}/g" "Sources/Integration/__DAD__ModuleLoader.swift"
sed -i '' "s/___VARIABLE_moduleName___/${NO_PREFIX_NAME}/g" "Sources/Integration/___VARIABLE_moduleName___ModulePlugin.swift"

mv "Sources/Integration/___VARIABLE_moduleName___BoardProducer.swift" "Sources/Integration/${NO_PREFIX_NAME}BoardProducer.swift"
# mv "Sources/Integration/__DAD__ModuleLoader.swift" "Sources/Integration/${NO_PREFIX_NAME}ModuleLoader.swift"
mv "Sources/Integration/___VARIABLE_moduleName___ModulePlugin.swift" "Sources/Integration/${NO_PREFIX_NAME}ModulePlugin.swift"

echo "✅ Initialized $NAME module successfully!"
