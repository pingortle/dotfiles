#!/bin/bash
set -eux

for dir in */
do
  test -f $dir/before.sh && bash $dir/before.sh
  stow --target=$HOME $dir
  test -f $dir/after.sh && bash $dir/after.sh
done
