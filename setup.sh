#!/bin/bash

echo "Detecting operating system..."

# borrowed from https://stackoverflow.com/a/394247

unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
  echo "Linux detected... running setup script"
  ./linux-setup.sh
elif [[ "$unamestr" == 'Darwin' ]]; then
  echo "Mac detected... running setup script"
  ./mac-setup.sh
else
  echo "Failed to detect OS by uname ($unamestr)"
fi
