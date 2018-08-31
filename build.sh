#!/bin/bash
set -o nounset
set -o pipefail
set -o errexit

rm --recursive build 2>/dev/null && :
echo 'beginning build'
mkdir --verbose --parents build
cp --verbose --no-target-directory --recursive src build
