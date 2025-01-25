#!/usr/bin/env bash

set -euo pipefail

echo "$1" > first-line.txt

seq 1 100 | while read -r x; do
    echo "$(fake_id "$1")" >> first-line.txt
done

echo "The secret is the first line of the file first-line.txt"
