#!/bin/sh

set -e

dir=$(cd $(dirname $0) && pwd)
url="https://raw/nope.tar.gz"

curl $url | tar -zxf -C /usr/local/bin

