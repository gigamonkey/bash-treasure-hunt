#!/usr/bin/env bash

set -euo pipefail

# Secret is line 33 of the file puzzle/lines.txt

sed -n 33p puzzle/lines.txt
