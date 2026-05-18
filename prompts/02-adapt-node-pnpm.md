# Node / pnpm 项目适配提示词

当前仓库已经导入 `templates/base` 安全基线。请在不削弱任何安全规则的前提下，将项目适配为 JavaScript / TypeScript / Node.js / Tauri 项目。

要求：

1. 默认使用 pnpm。
2. 保留并检查 `pnpm-workspace.yaml` 中的供应链安全配置。
3. 不允许使用 `dangerouslyAllowAllBuilds`。
4. 不允许自动执行或审批未知 install/postinstall/build 脚本。
5. package.json 必须设置 `packageManager`，并使用精确 pnpm 版本。
6. 依赖版本默认精确锁定，不使用 `^` 或 `~`。
7. 必须提交 `pnpm-lock.yaml`。
8. 新增依赖前必须说明用途、维护状态、替代方案、安全风险。
9. CI 必须使用 `pnpm install --frozen-lockfile`。
10. 不得删除 gitleaks、Renovate、Git hooks、AGENTS.md、SECURITY.md 中的规则。

如果当前项目不是 JS/TS/Tauri/Node.js 项目，不要套用本提示词。
