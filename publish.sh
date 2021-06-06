#!/bin/bash -e
set -e

VERSION=$1

SCRIPTS_DIR="$(dirname "$0")"

sh $SCRIPTS_DIR/bump.sh $VERSION
sh $SCRIPTS_DIR/push-spec.sh