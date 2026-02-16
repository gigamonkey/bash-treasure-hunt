#!/usr/bin/env bash

set -euo pipefail

echo "$1" > locked.txt

echo "Secret is in $PUZZLE/locked.txt. You're not allowed to open it though."

chmod 000 locked.txt
