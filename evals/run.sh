#!/usr/bin/env bash
# Full taiga-setup eval suite. Extra args pass through (e.g. --runs 1, --case '01*').
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

if find "$HOME/.docker" -type l 2>/dev/null | grep -q .; then
  echo "~/.docker has symlinks that block Bash-granting evals. Quit Docker, then: mv ~/.docker ~/.docker.off (restore after the run)." >&2
  exit 1
fi

# Only a full run (no extra args) overwrites the committed report.
REPORT=()
if [ $# -eq 0 ]; then
  REPORT=(--report evals/report.html)
fi

exec claude plugin eval . --ablation with-without --scaffold -j 4 --no-publish \
  --allow-tools "Bash(npx ng add:*),Bash(ng add:*),Bash(node_modules/.bin/ng add:*)" \
  ${REPORT[@]+"${REPORT[@]}"} "$@"
