#!/usr/bin/env bash

set -euo pipefail

tr 'a-zA-Z' 'n-za-mN-ZA-M' < puzzle/rot13.txt
