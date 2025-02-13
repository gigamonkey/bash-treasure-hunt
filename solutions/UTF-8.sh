#!/usr/bin/env bash

set -euo pipefail

# Secret is in $PUZZLE/UTF-8.txt. Youll have to decode the file from UTF-8 into ascii

temp=$(mktemp temp.XXX)
iconv -f UTF-8 -t ASCII puzzle/UTF-8.txt -o "$temp"
cat "$temp"