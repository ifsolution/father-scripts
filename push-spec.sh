#!/bin/bash -e
set -e

SPEC=$1

if [ -z $SPEC ]; then
    pod repo sync ifsolution-father-specs # --allow-warnings
else
    pod repo sync ifsolution-father-specs $SPEC # --allow-warnings
fi

