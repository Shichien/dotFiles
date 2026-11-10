# Windows DSH Desktop 配置

[desktop-profile](desktop-profile/) 保存本机 desktop profile 的四个可迁移配置文件；这是脱敏后的配置快照，不包含凭据、安装产物或完整 DSH 运行环境。

## 恢复前须知

- 使用兼容的 DSH Desktop，并备份目标 profile 后再合并配置；内置的 `@deepseek-ai/*` bundle 由 DSH 安装提供。
- [package.json](desktop-profile/package.json) 保留原有普通依赖版本。没有运行依赖安装或启动验证，不能保证当前包仓库可下载全部版本。
- `dsh-browser` 和 `dsh-preview-all-in-one` 原来使用机器本地 `file:` / `link:` 依赖，四个授权配置文件中没有可恢复的普通版本，因此已从 dependencies 和 bundles 一并移除。需要这些插件时，请先确认其可用发布版本或在新机器单独安装，再添加对应 bundle；不要提交本地绝对路径。
- 不保存机器专用 `generationProjection` 或指向 `.generations` 的本地 overrides；当前源 package 未包含这些字段。
- 保留 `apiKeyEnv: APIG_API_KEY` 引用。请在本机通过环境变量或 DSH 支持的凭据机制配置真实 API key，不要写入仓库。此次没有读取凭据文件。
- 模型服务地址和已禁用 remote-web-ui 的公开服务地址保留原配置，迁移时请按需更换。小红书 MCP 指向 `http://127.0.0.1:18060/mcp`，需要本机另行运行相应服务。
- 已移除 auto-continue 的机器会话 ID 映射，保留插件配置入口。
- 原配置默认权限为 `danger-full-access`，其审批策略为 `never`。这是原配置的保留值，不是安全默认值；在其他机器使用前建议改为更严格的权限预设。

## 文件

- [cordis.yml](desktop-profile/cordis.yml)：基础配置（空列表）。
- [cordis.patch.yml](desktop-profile/cordis.patch.yml)：桌面、模型、界面与插件配置。
- [package.json](desktop-profile/package.json)：profile bundle 与可迁移依赖声明。
- [pnpm-workspace.yaml](desktop-profile/pnpm-workspace.yaml)：pnpm 工作区及构建许可配置。

已对输出完成 JSON/YAML 解析检查、本地依赖/机器路径扫描及敏感字段复核；未执行安装或启动测试。
