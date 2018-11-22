#!/usr/bin/env bash
set -ex

./macos.sh
./brew.sh
./apps.sh
./install.sh
./bundle.sh
