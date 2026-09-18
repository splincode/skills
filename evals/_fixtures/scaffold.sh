#!/usr/bin/env bash
# Copy a minimal Angular 22 project WITHOUT Taiga UI into the case's working directory.
# No npm install: the suite only checks that `ng add taiga-ui` is called.
set -euo pipefail

FIXTURE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/angular-no-taiga"

cp -R "$FIXTURE"/. .
