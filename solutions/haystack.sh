#!/usr/bin/env bash

set -euo pipefail

# Secret is in the only file in puzzle/haystack that does not contain 'hay'.

cat "$(grep -L 'hay' puzzle/haystack/*)"
