#!/bin/sh

set -e

: ${VERSION:=1.0.1}

case "$OSTYPE" in
  darwin*) platform="darwin" ;;
  linux*) platform="linux" ;;
  *) echo "unknown platform"; exit 1 ;;
esac

dir=$(cd $(dirname $0) && pwd)
url="https://github.com/f5io/nope/releases/download/$VERSION/nope-$VERSION-$platform.tar.gz"

echo "👌  fetching download for nope $VERSION ($platform)"
curl -sL $url | tar -zxf - -C /usr/local/bin
echo "🎉  successfully installed nope $VERSION ($platform)"
