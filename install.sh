#!/usr/bin/env bash
set -eux

for dir in */
do
  ln -sf ../.stow-local-ignore $dir/
  stow -v --target=$HOME $dir
  test -f "$(basename $dir)_after".sh && bash "$(basename $dir)_after".sh
done
