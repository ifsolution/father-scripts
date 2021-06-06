#!/bin/bash -e
set -e

sed -i '' 's+:path+:binary => true, :git+g' Podfile
# sed -i '' 's:path.*$:binary => true:g' Podfile