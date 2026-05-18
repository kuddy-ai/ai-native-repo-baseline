#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${1:-}"
PROFILE="${2:-}"

if [[ -z "$TARGET_DIR" ]]; then
  echo "Usage: bash scripts/apply-template.sh <target-dir> [node-pnpm|python-uv|rust|go]"
  exit 1
fi

mkdir -p "$TARGET_DIR"

copy_dir() {
  local src="$1"
  local dst="$2"
  (cd "$src" && tar cf - .) | (cd "$dst" && tar xpf -)
}

echo "Applying base template to: $TARGET_DIR"
copy_dir "$ROOT_DIR/templates/base" "$TARGET_DIR"

if [[ -n "$PROFILE" ]]; then
  if [[ ! -d "$ROOT_DIR/templates/$PROFILE" ]]; then
    echo "Unknown profile: $PROFILE"
    echo "Allowed: node-pnpm, python-uv, rust, go"
    exit 1
  fi
  echo "Applying profile: $PROFILE"
  copy_dir "$ROOT_DIR/templates/$PROFILE" "$TARGET_DIR"
fi

if [[ -d "$TARGET_DIR/.githooks" ]]; then
  chmod +x "$TARGET_DIR/.githooks/commit-msg" "$TARGET_DIR/.githooks/pre-commit" "$TARGET_DIR/.githooks/pre-push" 2>/dev/null || true
fi

echo "Done. Next steps:"
echo "  cd $TARGET_DIR"
echo "  bash scripts/setup-hooks.sh"
echo "  git checkout -b chore/issue-1-initialize-repository"
echo "  git add ."
echo "  git commit -m \"chore(init): initialize repository"
echo ""
echo "Refs: #1\""
