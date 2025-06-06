#!/usr/bin/env bash

set -euo pipefail

echo "$1" | sed 's/./&-/g' | sed 's/-$//' >> dash-removal.txt

echo "Secret is in $PUZZLE/dash-removal.txt. Remove all '-' to get the secret. Can you decode it?"
