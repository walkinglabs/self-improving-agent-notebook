#!/usr/bin/env bash
#
# Run the online notebook reader locally.
#
#   scripts/serve_web.sh              # Vite dev server with hot reload
#   scripts/serve_web.sh --preview    # production build, served locally
#
# The reader builds its catalog from notebooks/ and notebooks-en/ when the
# server starts, so added, renamed or removed .ipynb files show up without
# any further configuration.
#
# Environment:
#   PORT   port to listen on (default 5273)

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WEB_DIR="$REPO_ROOT/web"
PORT="${PORT:-5273}"

if ! command -v npm >/dev/null 2>&1; then
  echo "error: npm not found. Install Node.js 20 or newer." >&2
  exit 1
fi

if [ ! -d "$WEB_DIR/node_modules" ]; then
  echo "==> installing web dependencies (first run)"
  (cd "$WEB_DIR" && npm install)
fi

cd "$WEB_DIR"

if [ "${1:-}" = "--preview" ]; then
  # Build into web/dist (gitignored) rather than the committed ../docs output.
  npx vite build --outDir dist --emptyOutDir
  echo "==> serving production build on http://127.0.0.1:${PORT}/"
  exec npx vite preview --outDir dist --host 127.0.0.1 --port "$PORT"
fi

echo "==> dev server on http://127.0.0.1:${PORT}/"
exec npm run dev -- --port "$PORT"
