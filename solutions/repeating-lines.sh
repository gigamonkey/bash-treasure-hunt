#!/usr/bin/env bash

set -euo pipefail

cat puzzle/duplicates.txt | sort | uniq -c | sort -n | head -1 | awk -F' 1 ' '{print $2}'