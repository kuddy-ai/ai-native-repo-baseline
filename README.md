# AI Native Repository Baseline

这是一个用于 **AI Coding Agent 项目开发** 的仓库初始化安全基线模板。

它的目标不是替代具体语言框架，而是在所有新项目开始前先放入统一的安全底座，重点防范：

- AI 误操作导致安全规则被削弱
- Prompt Injection / Indirect Prompt Injection
- MCP Tool Poisoning
- 供应链投毒和恶意安装脚本
- GitHub Actions 权限滥用
- 密钥、token、证书和隐私信息泄露
- AI 为了“让项目跑起来”自动关闭测试、lint、安全扫描

## 推荐使用方式

### 1. 复制通用安全基线

```bash
bash scripts/apply-template.sh /path/to/new-repo
```

### 2. 按技术栈追加语言模板

```bash
# JS / TS / Tauri / Node.js
bash scripts/apply-template.sh /path/to/new-repo node-pnpm

# Python / uv
bash scripts/apply-template.sh /path/to/new-repo python-uv

# Rust
bash scripts/apply-template.sh /path/to/new-repo rust

# Go
bash scripts/apply-template.sh /path/to/new-repo go
```

Windows PowerShell：

```powershell
./scripts/apply-template.ps1 -TargetDir "D:\work\new-repo" -Profile node-pnpm
```

### 3. 发给 AI Coding Agent 的初始化提示词

复制：

```text
prompts/01-init-repository.md
```

并在开头补充：

```text
当前仓库已经导入 ai-native-repo-baseline 模板。
你必须基于现有模板文件继续初始化项目，不得删除、弱化、绕过其中的安全规则。
只有在增强安全性或适配当前技术栈时，才允许修改这些文件。
```

## 目录结构

```text
prompts/                 # 给 AI Coding Agent 使用的提示词
templates/base/          # 所有项目都应该复制的通用安全基线
templates/node-pnpm/     # JS/TS/Tauri/Node 项目追加模板
templates/python-uv/     # Python/uv 项目追加模板
templates/rust/          # Rust 项目追加模板
templates/go/            # Go 项目追加模板
scripts/                 # 把模板应用到新仓库的脚本
```

## 基线文件说明

| 文件 | 作用 |
|---|---|
| `AGENTS.md` | AI Coding Agent 项目规则入口 |
| `SECURITY.md` | 安全报告、密钥泄露、供应链漏洞处理流程 |
| `CONTRIBUTING.md` | Issue、分支、Commit、PR 协作规范 |
| `.githooks/` | 本地 Git 硬约束 |
| `.github/workflows/ci.yml` | CI 安全基线 |
| `renovate.json` | 依赖升级冷却期和禁止自动合并 |
| `gitleaks.toml` | 密钥扫描策略 |
| `docs/AI_SECURITY_CHECKLIST.md` | AI 开发安全检查清单 |
| `docs/DEPENDENCY_POLICY.md` | 依赖和供应链安全策略 |
| `docs/CI_SECURITY_POLICY.md` | GitHub Actions / CI 安全策略 |
| `docs/LOGGING_POLICY.md` | 日志脱敏和观测策略 |

## 第一次提交建议

```bash
git checkout -b chore/issue-1-initialize-repository
bash scripts/setup-hooks.sh
git add .
git commit -m "chore(init): initialize repository

Refs: #1"
```

## 维护建议

这个仓库建议作为独立模板仓库维护。后续遇到新的 AI 开发攻击、供应链事件、CI/CD 风险时，优先更新这里，再同步到业务项目。
