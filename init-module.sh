#!/bin/bash -e

set -ex

git clone git@github.com:ifsolution/module-structure-template.git

cp -a module-structure-template/IO/ ./IO/
cp -a module-structure-template/Sources/ ./Sources/

rm -rf module-structure-template