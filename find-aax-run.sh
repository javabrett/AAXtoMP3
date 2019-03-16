#!/usr/bin/env bash

# bash strict mode
set -euo pipefail

find . -iname "*.aax" | xargs ./AAXtoMP3 "$@"
