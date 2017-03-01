#!/bin/sh

set -e

version="1.0.0"
dir=$(cd $(dirname $0) && pwd)
url="https://github.com/f5io/nope/releases/download/$version/nope.tar.gz"

echo "👌  fetching binary for nope $version"
curl -sL $url | tar -zxf - -C /usr/local/bin
echo "🎉  successfully installed nope $version"
