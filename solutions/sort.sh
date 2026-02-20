#!/bin/env bash

set -euo pipefail

str=""

for num in $(<puzzle/sort-nums.txt); do
    str="${str}$(sed -n "${num}p" puzzle/sort-words.txt) "
done

echo "$str"