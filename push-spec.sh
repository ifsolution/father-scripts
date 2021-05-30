#!/bin/bash -e
set -e

SPEC=$1

if [ -z $SPEC ]; then
    pod repo push father --allow-warnings
else
    pod repo push father $SPEC --allow-warnings
fi

