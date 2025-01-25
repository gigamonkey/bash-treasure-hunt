#!/usr/bin/env bash

set -euo pipefail

perl -ne '/^\w+: .*/ and print' puzzle/final_file.txt
