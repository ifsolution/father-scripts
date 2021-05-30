#!/bin/bash -e
set -e

VERSION=$1

sh scripts/bump.sh $VERSION
sh scripts/push-spec.sh