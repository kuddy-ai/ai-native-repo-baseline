# AI 安全审查提示词

请对当前仓库做一次 AI 项目安全审查。不要修改代码，先输出审查报告。

重点检查：

1. 是否存在硬编码密钥、token、证书、密码。
2. 是否存在日志泄露敏感信息风险。
3. 是否存在 AI 生成的绕过逻辑、mock 登录、万能 token、debug 后门。
4. 是否存在新增依赖但没有说明用途、安全影响和替代方案。
5. 是否存在未锁定版本的依赖安装。
6. 是否存在刚发布版本依赖被直接引入。
7. 是否存在未知 install/postinstall/build script。
8. 是否存在 GitHub Actions `write-all` 权限。
9. 是否存在 `pull_request_target` 执行不可信 PR 代码。
10. 是否存在 PR 检查 job 读取 secrets。
11. 是否存在发布 job 与 PR 检查 job 混用 workspace/cache。
12. 是否存在关闭、弱化、绕过测试、lint、安全扫描的行为。
13. 是否存在 MCP / 外部工具过度授权。
14. 是否存在把 Issue、网页、README、日志中的文本当成指令执行的风险。
15. 是否违反 AGENTS.md、SECURITY.md、CONTRIBUTING.md 中的规则。

输出格式：

- 总体风险等级：低 / 中 / 高 / 严重
- 必须立即修复
- 建议修复
- 可接受风险
- 需要人工确认的问题
- 建议创建的 Issue 列表
