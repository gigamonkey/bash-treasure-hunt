#!/usr/bin/env bash

set -euo pipefail

iconv -f ASCII -t UTF-8 <(echo "$1") -o octal.txt

echo "Secret has been dumped into $PUZZLE/octal.txt. Who knows how to decode it? Maybe ask the chinese..."