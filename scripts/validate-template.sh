#!/usr/bin/env bash
set -euo pipefail

required=(
  "README.md"
  "LICENSE"
  "CHANGELOG.md"
  ".gitattributes"
  "prompts/01-init-repository.md"
  "templates/base/AGENTS.md"
  "templates/base/SECURITY.md"
  "templates/base/CONTRIBUTING.md"
  "templates/base/.githooks/commit-msg"
  "templates/base/.githooks/pre-commit"
  "templates/base/.githooks/pre-push"
  "templates/base/.github/workflows/ci.yml"
  "templates/base/renovate.json"
  "templates/base/gitleaks.toml"
  "templates/base/docs/RELEASE_PLEASE_POLICY.md"
  "templates/node-pnpm/package.json"
  "templates/node-pnpm/pnpm-workspace.yaml"
  "templates/python-uv/pyproject.toml"
  "templates/rust/Cargo.toml"
  "templates/go/go.mod"
)

for f in "${required[@]}"; do
  if [[ ! -e "$f" ]]; then
    echo "Missing: $f"
    exit 1
  fi
done

for f in scripts/apply-template.sh scripts/validate-template.sh templates/base/.githooks/commit-msg templates/base/.githooks/pre-commit templates/base/.githooks/pre-push templates/base/scripts/setup-hooks.sh; do
  chmod +x "$f"
done

echo "Template validation passed."
