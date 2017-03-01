#!/bin/sh

set -e

dir=$(cd $(dirname $0) && pwd)
url="https://github.com/f5io/nope/releases/download/1.0.0/nope.tar.gz"

curl -sL $url | tar -zxf - -C /usr/local/bin

