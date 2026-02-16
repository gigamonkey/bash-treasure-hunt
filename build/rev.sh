#!/usr/bin/env bash

set -euo pipefail

echo "$1" | rev > rev.txt

echo "Secret is in $PUZZLE/rev.txt. Can you decode it?"
