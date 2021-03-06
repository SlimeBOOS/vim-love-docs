#!/bin/bash

# Set the current directory to the location of this script
pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" > /dev/null

# Quit on errors and unset vars
# set -o errexit
# set -o nounset

echo Generating docs

# Update the doc directory
rm -rf ../../doc
mkdir ../../doc

# Generate documentation
lua5.3 main.lua  > ../../doc/love.txt

# Generate helptags
vim -es --noplugin -c "helptags ../../doc/" -c "qa!"

# Cleanup
rm -rf love-api

popd > /dev/null
