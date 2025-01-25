#!/usr/bin/env bash

set -euo pipefail

cat puzzle/rot13.txt | tr 'a-zA-Z' 'n-za-mN-ZA-M'
