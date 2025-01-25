#!/usr/bin/env bash

set -euo pipefail

echo "$1" | tr 'a-zA-Z' 'n-za-mN-ZA-M' > rot13.txt

echo "Secret is in $PUZZLE/rot13.txt. Can you decode it?"
