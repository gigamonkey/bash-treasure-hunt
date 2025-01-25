#!/usr/bin/env bash

set -euo pipefail

mkdir -p lots-of-files
touch lots-of-files/{a..g}{a..g}.txt

echo "$1" > "$(ls -1 lots-of-files/* | shuf | head -1)"

echo "Your next secret is in the only non-empty file in the lots-of-files directory."
