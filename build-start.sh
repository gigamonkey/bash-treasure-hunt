#!/usr/bin/env bash

set -euo pipefail

cat preamble.sh
shar build progress .version $(find build) | egrep -v '^echo . ' | gzip -c | base64
cat postamble.sh
