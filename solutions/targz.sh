#!/usr/bin/env bash

set -euo pipefail

# Secret is in archive/secret but you need to unpack archive.tar.gz to get at it.

tar xzf puzzle/archive.tar.gz -O archive/secret
