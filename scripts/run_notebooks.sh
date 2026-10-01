#!/usr/bin/env bash
#
# Launch JupyterLab at the repository root, so both notebooks/ and
# notebooks-en/ are browsable from a single server.
#
#   scripts/run_notebooks.sh
#
# Environment:
#   PORT   port to listen on (default 8888)

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PORT="${PORT:-8888}"

# Prefer the virtualenv described in the README, fall back to PATH.
if [ -x "$REPO_ROOT/.venv/bin/jupyter" ]; then
  JUPYTER="$REPO_ROOT/.venv/bin/jupyter"
elif command -v jupyter >/dev/null 2>&1; then
  JUPYTER="$(command -v jupyter)"
else
  cat >&2 <<'EOF'
error: jupyter not found.

Create the environment first (see README > Quick Start):

    python3 -m venv .venv
    source .venv/bin/activate
    python -m pip install -r requirements.txt jupyterlab
EOF
  exit 1
fi

# Use JupyterLab when it is installed, otherwise the classic notebook server.
# Both default their root directory to the current working directory.
if "$JUPYTER" lab --version >/dev/null 2>&1; then
  SUBCOMMAND=lab
else
  SUBCOMMAND=notebook
fi

cd "$REPO_ROOT"
echo "==> jupyter ${SUBCOMMAND} on http://127.0.0.1:${PORT}/ (root: $REPO_ROOT)"
exec "$JUPYTER" "$SUBCOMMAND" --no-browser --ip=127.0.0.1 --port="$PORT"
