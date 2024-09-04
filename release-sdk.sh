#!/bin/bash -e

set -e

VERSION=$(cat sdk-version)
echo "Fixed version $VERSION"

git fetch --tags --recurse-submodules=no

TAG=$(git describe --tags --abbrev=0)
echo "Tag version $TAG"

# envman add --key LATEST_SDK_VERSION --value ${VERSION}

if [ "$VERSION" == "$TAG" ]; then
    echo "Latest SDK version $TAG. Skip releasing a new version."
    # envman add --key BUILD_MESSAGE --value "Latest SDK version $TAG. Skip releasing a new version."
    exit 0
else
    echo "Prepare to release SDK version $VERSION"

    # publish new version
    pod repo bump $VERSION

    git submodule foreach git tag $VERSION
    git submodule foreach git push origin --tags

    pod repo sync ifsolution-father-specs

    git submodule foreach git reset --hard

    # push new tag
    git tag $VERSION
    git push origin --tags

    echo "Release SDK version $VERSION successfully"
    # envman add --key BUILD_MESSAGE --value "Release SDK version $VERSION successfully"
fi
