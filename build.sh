#!/bin/sh

set -e

dir=$(cd $(dirname $0) && pwd)

swiftc $dir/src/main.swift -o $dir/bin/nope
tar -zcf $dir/release/nope.tar.gz -C $dir/bin nope
