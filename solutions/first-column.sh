#!/usr/bin/env bash

set -euo pipefail

cut -c 1 puzzle/columns.txt | paste -sd ''
