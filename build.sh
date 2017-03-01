#!/bin/sh

set -e

: ${VERSION:=1.0.1}

dir=$(cd $(dirname $0) && pwd)

echo "👌  compiling binary for nope $VERSION"
swiftc $dir/src/main.swift -o $dir/bin/nope
echo "👌  compressing binary for nope $VERSION"
tar -zcf $dir/release/nope-$VERSION.tar.gz -C $dir/bin nope
