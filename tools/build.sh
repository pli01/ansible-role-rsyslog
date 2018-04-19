#!/bin/bash
set -x
PACKAGENAME=${1:? PACKAGENAME not found}
VERSION=${2:? VERSION not found}

build_dir="build/${PACKAGENAME}-${VERSION}"

[ -d $build_dir ] && rm -rf $build_dir
mkdir -p $build_dir

echo "# Prepare build directory $build_dir"
( find * -type f ! -regex "build" -print0 | tar cf - --null -T - ) | ( cd $build_dir && tar xvf -)
