#!/usr/bin/env bash

set -euo pipefail

grep -o 'LeBron.*' puzzle/LeBronInfo.txt \
  | sed -n '50p' \
  | sed 's/^LeBron\s*//'