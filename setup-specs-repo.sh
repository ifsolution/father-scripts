#!/bin/bash -e

set -ex

gem install cocoapods-sync-podspecs

pod repo add ifsolution-father-specs https://github.com/ifsolution/father-specs.git
