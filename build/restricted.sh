#!/usr/bin/env bash

set -euo pipefail

echo "$1" > locked.txt

echo "Secret is in $PUZZLE/locked.txt. Can you decode it?"

chmod 000 locked.txt