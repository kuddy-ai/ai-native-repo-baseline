# Go 项目适配提示词

当前仓库已经导入 `templates/base` 安全基线。请在不削弱任何安全规则的前提下，将项目适配为 Go 项目。

要求：

1. 使用 Go Modules。
2. 提交 `go.mod` 和 `go.sum`。
3. CI 必须运行：
   - gofmt 检查
   - `go vet ./...`
   - `go test ./...`
   - `govulncheck ./...`，若已安装或已配置
4. 新增依赖前必须说明用途、维护状态、替代方案、安全风险。
5. 不允许把敏感信息写入日志。
6. 不得删除 gitleaks、Renovate、Git hooks、AGENTS.md、SECURITY.md 中的规则。

如果当前项目不是 Go 项目，不要套用本提示词。
