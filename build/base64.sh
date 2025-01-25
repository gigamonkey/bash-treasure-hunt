#!/usr/bin/env bash

set -euo pipefail

echo "$1" | base64 > base64.txt

echo "Your next secret is in $PUZZLE/base64.txt. Can you decode it?"
