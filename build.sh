#!/bin/sh

set -e

: ${VERSION:=1.0.1}

dir=$(cd $(dirname $0) && pwd)

echo "👌  compiling binary (darwin) for nope $VERSION"
swiftc $dir/src/darwin/main.swift -static-stdlib -o $dir/bin/darwin/nope
echo "⚡  compressing binary (darwin) for nope $VERSION"
tar -zcf $dir/release/nope-$VERSION-darwin.tar.gz -C $dir/bin/darwin nope
echo "🎉  sucessfully built (darwin)" 

echo "👌  compiling executable (windows) for nope $VERSION"
fsharpc $dir/src/windows/main.fs --target:exe -r "System.Management.dll" --standalone --nologo -o $dir/bin/windows/nope.exe
echo "⚡  compressing executable (windows) for nope $VERSION"
tar -zcf $dir/release/nope-$VERSION-windows.tar.gz -C $dir/bin/windows nope.exe
echo "🎉  successfully built (windows)"

echo "👌  exporting script (linux) for nope $VERSION"
cp $dir/src/linux/main.sh $dir/bin/linux/nope
echo "⚡  compressing script (linux) for nope $VERSION"
tar -zcf $dir/release/nope-$VERSION-linux.tar.gz -C $dir/bin/linux nope
echo "🎉  successfully built (linux)"

