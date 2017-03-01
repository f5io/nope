#!/bin/sh

set -e

: ${VERSION:=1.0.1}

dir=$(cd $(dirname $0) && pwd)
url="https://github.com/f5io/nope/releases/download/$VERSION/nope-$VERSION.tar.gz"

echo "👌  fetching binary for nope $VERSION"
curl -sL $url | tar -zxf - -C /usr/local/bin
echo "🎉  successfully installed nope $VERSION"
