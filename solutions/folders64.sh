#!/usr/bin/env bash

set -euo pipefail

# The next secret is encoded in the names of directories starting with /folders
find puzzle/folders | tail -1 | tr -d "/" | cut -c 8- | base64 -d