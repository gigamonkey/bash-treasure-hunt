#!/usr/bin/env bash

set -euo pipefail

iconv -f ASCII -t UTF-8 <(echo "$1") -o UTF-8.txt

echo "Secret is in $PUZZLE/UTF-8.txt. Youll have to decode the file from UTF-8 into ascii"