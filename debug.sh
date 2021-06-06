#!/bin/bash -e
set -e

VERSION=$1

sed -i '' "s+# PODS_BINARY_MARK+require_relative 'scripts/prebuild_debug.rb'\nprebuild_debug!+g" Podfile

# SCRIPTS_DIR="$(dirname "$0")"
# sh $SCRIPTS_DIR/config-pods-binary.sh

sed -i '' 's+:path+:binary => true, :git+g' Podfile

pod install
pod binary prebuild

cp -f -R _Prebuild/**/*.xcframework submodules/sdk/Frameworks/
echo "✅ Copy Frameworks to BomBiSDK"

if [ ! -z $VERSION ]; then
    cd submodules/sdk
    sh scripts/publish.sh "$VERSION"
fi

exit 0
# git reset --hard