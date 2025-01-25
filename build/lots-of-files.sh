#!/usr/bin/env bash

set -euo pipefail

mkdir -p lots-of-files
touch lots-of-files/{a..g}{a..g}.txt

echo "$1" > "$(find lots-of-files -type f | shuf | head -1)"

echo "Secret is in the only non-empty file in $PUZZLE/lots-of-files"
