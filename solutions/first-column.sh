#!/usr/bin/env bash

set -euo pipefail

# Secret is in the first column of puzzle/columns.txt

cut -c 1 puzzle/columns.txt | paste -sd ''
