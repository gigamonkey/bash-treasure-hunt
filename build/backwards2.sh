#!/usr/bin/env bash

set -euo pipefail

echo "$1" | rev > backwards2.txt

echo "Secret is in $PUZZLE/backwards2.txt. Can you decode it?"

