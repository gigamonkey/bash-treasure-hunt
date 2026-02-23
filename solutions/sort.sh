#!/bin/env bash

set -euo pipefail

paste puzzle/sort-nums.txt puzzle/sort-words.txt  | sort -n | cut -f 2 | paste -s -d ' '