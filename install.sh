#!/bin/bash
set -eux

for dir in */
do
  stow -v --target=$HOME $dir
  test -f "$(basename $dir)_after".sh && bash "$(basename $dir)_after".sh
done
