#!/usr/bin/env bash

set -euo pipefail

perl -ne '/^\w+: .*/ and print' puzzle/penultimate.txt
