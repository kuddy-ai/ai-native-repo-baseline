# Python / uv 项目适配提示词

当前仓库已经导入 `templates/base` 安全基线。请在不削弱任何安全规则的前提下，将项目适配为 Python 项目。

要求：

1. 默认使用 uv。
2. 使用 `pyproject.toml` 管理项目。
3. 提交 `uv.lock`。
4. 依赖解析必须启用冷却期策略。
5. 不允许直接使用 `pip install xxx` 绕过锁文件。
6. 新增依赖前必须说明用途、维护状态、替代方案、安全风险。
7. CI 必须使用锁文件安装。
8. 若存在测试目录，必须运行 pytest。
9. 若配置了 ruff / mypy / pyright，CI 必须运行对应检查。
10. 不得删除 gitleaks、Renovate、Git hooks、AGENTS.md、SECURITY.md 中的规则。

如果当前项目不是 Python 项目，不要套用本提示词。
