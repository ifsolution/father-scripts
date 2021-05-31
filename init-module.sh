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

sed -i '' "s/DadModule/Dad${NAME}/g" "DadModule.podspec"
sed -i '' "s/DadModule/Dad${NAME}/g" "DadModuleIO.podspec"

mv DadModule.podspec "Dad${NAME}.podspec"
mv DadModuleIO.podspec "Dad${NAME}IO.podspec"