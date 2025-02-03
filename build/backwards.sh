#!/usr/bin/env bash

set -euo pipefail

echo "$1" | rev > backwards.txt

echo "Secret is in $PUZZLE/backwards.txt. Can you decode it?"

