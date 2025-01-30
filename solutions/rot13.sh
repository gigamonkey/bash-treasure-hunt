#!/usr/bin/env bash

set -euo pipefail

# Secret is in puzzle/rot13.txt. Can you decode it?

tr 'a-zA-Z' 'n-za-mN-ZA-M' < puzzle/rot13.txt
