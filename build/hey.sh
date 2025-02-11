#!/usr/bin/env bash

set -euo pipefail

echo $1 | sed 's/./&-/g' | sed 's/-$//' >> hey.txt

echo "Secret is in $PUZZLE/hey.txt. Remove all '-' to get the secret. Can you decode it?"