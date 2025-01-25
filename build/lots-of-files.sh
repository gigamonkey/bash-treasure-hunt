#!/usr/bin/env bash

set -euo pipefail

mkdir -p lots-of-files
touch lots-of-files/{a..g}{a..g}.txt

echo "$1" > "$(find lots-of-files -type f | shuf | head -1)"

echo "Your next secret is in the only non-empty file in the $PUZZLE/lots-of-files directory."
