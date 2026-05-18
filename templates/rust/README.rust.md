# Rust 安全适配说明

初始化后请执行：

```bash
cargo generate-lockfile
cargo fmt --check
cargo clippy --all-targets --all-features -- -D warnings
cargo test
```

要求：

- 应用程序类项目必须提交 `Cargo.lock`。
- 新增 crate 必须走 Issue + PR。
- 不允许为了通过 clippy 大面积添加 `allow`。
