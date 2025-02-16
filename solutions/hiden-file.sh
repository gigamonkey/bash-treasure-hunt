#!/usr/bin/env bash

set -euo pipefail

line=$(head -n 16 puzzle/menylines.txt | tail -n 1)

echo "$line" | tr 'a-zA-Z' 'n-za-mN-ZA-M'
