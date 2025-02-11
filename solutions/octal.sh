#!/usr/bin/env bash

set -euo pipefail

# Secret has been dumped into $PUZZLE/octal.txt. Who knows how to decode it? Maybe ask the chinese...

iconv -f UTF-8 -t octal.txt -o -