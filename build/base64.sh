#!/usr/bin/env bash

set -euo pipefail

echo "$1" | base64 > base64.txt

echo "Secret is in $PUZZLE/base64.txt. Can you decode it?"
