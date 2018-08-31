#!/bin/bash
set -o nounset
set -o pipefail
set -o errexit

rm -r build 2>/dev/null && :
mkdir -p build
cp src/* build/
