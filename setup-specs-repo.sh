#!/bin/bash -e

set -ex

gem install cocoapods-sync-podspecs

pod repo add father https://github.com/ifsolution/father-specs.git
