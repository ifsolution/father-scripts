#!/bin/bash -e
set -e

SPEC=$1

if [ -z $SPEC ]; then
    pod repo sync father # --allow-warnings
else
    pod repo sync father $SPEC # --allow-warnings
fi

