#!/bin/bash -e
set -e

sed -i '' "s+# PODS_BINARY_MARK+require_relative 'scripts/prebuild_release.rb'\nprebuild_release!+g" Podfile

# SCRIPTS_DIR="$(dirname "$0")"
# sh $SCRIPTS_DIR/config-pods-binary.sh

sed -i '' 's:path.*$:binary => true:g' Podfile

pod install
pod binary prebuild

# git reset --hard
