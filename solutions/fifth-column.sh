#!/usr/bin/env bash

set -euo pipefail

# Secret is in the first column of puzzle/columns.txt

cut -c 5 puzzle/columns.txt | paste -sd ''
