# dotFiles
Stores Deralive's configuration files.
仅供自查，可参考配置。

## 目录约定

跨平台通用的配置直接放在软件目录下；平台相关的配置按 `win/` 和 `mac/` 分子目录存放，不要混在一起：

```
pixpin/win/PixPin.pixconf          pixpin/mac/PixPinConfig.json
vscode_config/win/                 vscode_config/mac/
Rime/win/  Rime/mac/               词库等通用部分留在 Rime/ 根目录
starship/win/                      starship/mac/
zsh/mac/                           （zsh 配置仅 macOS）
fastfetch/mac/                     （fastfetch 配置仅 macOS）
tmux/mac/tmux.conf                 （tmux 仅 macOS 使用）
Karabiner/mac/                     （Karabiner 仅 macOS，无 win 目录）
```

## Windows 本机同步（2026-11-10）

- Windows 配置以本机当前设置为准，macOS 配置保持不变。
- `pixpin/win/PixPin.pixconf` 更新自本机 PixPin，保留导入格式，移除存储时间戳、翻译密钥及网络代理字段；恢复后按需自行补回。
- `vscode_config/win/` 同步当前设置和快捷键，导入用 profile 内的设置/快捷键同步更新，扩展清单保留原版本；认证信息不入库。机器路径和程序依赖仍需按目标电脑调整。
- `vscode_config/win/snippets/latex.json` 为本机 LaTeX 用户片段，恢复到 VS Code 用户目录的 `snippets/` 下；当前 `Ctrl+Alt+B` 依赖工作区任务 `C++: Run active file (build + run + clean)`，本机没有用户级 tasks 文件，本仓库不自动创建该任务。
- `ClashForWindows/cfw-settings.yaml` 与 `TrafficMonitor/config.ini` 更新为本机偏好，不包含代理订阅、节点配置或流量历史。
- Windows DSH Desktop 配置另存于 `DSH/win/desktop-profile/`，不覆盖现有 `DSH/web-profile/`；恢复限制见 `DSH/win/README.md`。
- Rime、Starship、Nushell、WezTerm 的实际设置无变化，本次不重复同步；不新增个人学习词库、运行缓存或凭据文件。

## zsh 配置

macOS 的 shell 启动链，位于 `zsh/mac/`，分别对应家目录下的同名点文件：

| 文件 | 作用 |
| --- | --- |
| `.zshrc` | 主配置：别名、补全、fzf、fastfetch 启动、Kali 靶场函数 |
| `.zprofile` | Homebrew `shellenv` 与 Python 路径 |
| `.zshenv` | cargo 环境与 Python 路径（对所有 zsh 生效） |
| `.shinit` / `.bashrc` / `.profile` / `.tcshrc` | 各 shell 的最小入口，多为加载 cargo 或 x-cmd |

`.zshrc` 的主要内容：

- **别名**：`ls`/`ll`/`la`/`tree` 走 `eza`，`cat`/`less` 走 `bat`（`BAT_THEME="Catppuccin Mocha"`）
- **提示符**：starship，配置由 `STARSHIP_CONFIG` 指向 `~/.config/starship.toml`
- **补全**：`zsh-completions` + `zsh-autosuggestions`（灰色联想），`zsh-syntax-highlighting` **必须最后加载**
- **fzf**：`Ctrl+R` 历史、`Ctrl+T` 文件、`Alt+C` 目录
- **代理**：`HTTP_PROXY` 等统一指向 `127.0.0.1:7890`，`NO_PROXY` 排除本机
- **Kali 靶场**：`kali`、`kali-stop`、`lab` 三个函数，依赖 `$HOME/Downloads/kali-lab`
- **fastfetch**：交互式终端启动时打印系统信息，tmux 内每个会话只打一次（用 `@ff_shown` 标记）

> 注意：`.zshrc` 硬编码了 `/opt/homebrew`、`$HOME/.venvs/default`、`$HOME/Downloads/kali-lab`、`~/.x-cmd.root/X` 等 macOS 专属路径，换机器需相应调整。

## fastfetch 配置

`fastfetch/mac/config.jsonc`，对应 `~/.config/fastfetch/config.jsonc`：中文键名、Catppuccin 配色、`Apple_small` logo，被 `.zshrc` 在交互式启动时调用。

## VSCode 配置

分 `win/` 与 `mac/` 两套。Windows 侧于左下角 `设置->配置文件` 中可以直接导入 `vscode_config/win/vscode-config.code-profile`，可以一键配置：
- Plugins、Key Bindings、Themes、Workspace
- 特色:
    - 使用 LLVM 实现走 Clang++ 编译 C++ 代码（注意：万能头文件应置于 v1/bits/stdc++.h 中）
    - 使用不同的 LSP + ErrorLen 插件实现代码报错提示
    - 使用 Double Lines 插件为 Vim 实现 Relative Line 显示
    - 配置 Prettier 以为不同语言配置不同的代码格式化方式
    - 实现 Markdown 编辑器显示侧边预览
- Key Bindings:
    - 使用 `Ctrl + Alt + L` 看齐 Jetbrains 代码格式化
    - 使用 `Ctrl + R` 看齐 Jetbrains 代码替换
    - Todo: 使用 `Shift + F6` 看齐变量名重构

macOS 侧配置位于 `vscode_config/mac/`（`settings.json`、`keybindings.json`），对应 `~/Library/Application Support/Code/User/`。
注意：mac 版 `settings.json` 中已剔除 `claudeCode.environmentVariables` 的 `ANTHROPIC_AUTH_TOKEN` 等密钥，还原时需自行补回。

## PixPin 配置
一款优秀的截图软件，使用 `Alt + A` 截图。

- `pixpin/win/PixPin.pixconf`：Windows 版，导入用
- `pixpin/mac/PixPinConfig.json`：macOS 版，对应 `~/Library/Application Support/PixPin/Config/PixPinConfig.json`

## Vimium C 配置
基于 Chrome 内核的浏览器使用的 Vim 插件，删除不必要的键位，适配逻辑操作：

### 基础操作
- 使用 `Shift + H/L` 移动至左/右侧标签页
- 使用 `Ctrl + J/K` 向上下移动半页
- 使用 `r` 键刷新子网页，取消静态资源多加载的情况
- 使用 `<<` 和 `>>` 进行前进和后退

### 搜索框
- `o`: 搜索混合内容并在新标签页打开
- `b`: 搜索已隐藏内容并在新标签页打开
- `T`: 在所有标签页中搜索

### 标签页和窗口
- `L`: 切换到右侧标签页
- `H`: 切换到左侧标签页
- `<c-n>`: 打开新的标签页
- `x`: 关闭当前标签页
- `<c-w>`: 移动到当前标签页的下一个窗口
- `<a->`: 切换到最近访问的上一个标签页
  
### 其他功能
- `yy`: 复制当前网页的 URL
- `yyp**: 基于 `yy` 快速复制标签页
- `yi`: 复制图片到剪贴板
- `gu`: 访问上一层网站
- `gi`: 进入输入框选择模式

## CapsLock Plus
- `CapsLock + Q` 打开 QBar，在任何界面快速打开浏览器进行搜索
  - 可选项有 `bing`、`youtube`、`github`、`wiki`、`bilibili`、`all`
  - 在输入 `all <content>` 后同时开启五个搜索引擎
  - 在输入 `cmd <command>` 后可以快速执行 Powershell 命令
- `CapsLock + O / Enter`，模仿 Vim 模式新建一行
- `CapsLock + I / A`，模仿 Vim 模式进入行首和行尾（模拟 `Home`、`End`）
- `CapsLock + Backspace`，模仿 Vim 模式删除一行
- `CapsLock + W`，快速打开一个在桌面上创建的记事本

## Others
- 使用 `Ctrl+ Win + T` 置顶当前窗口
- 在文件夹中使用 `Ctrl + Space` 进行文件速览（基于 PowerToys）
- [Alt-Tab Terminator](https://www.ntwind.com/software/alttabter.html)：更好的 `Alt-Tab`
- 可以使用 `Alt + Esc` 键快速在两个窗口之间切换

## Windows HotKeys
- `Win + E`, `Win + R`, `Win + I`, `Win + P`, `Win + G`, `Win + H`, `Win + Z`, `Win + X`, `Win + V`, `Win + B`
- 其余的 Windows 快捷键均被禁用

## Moonlight HotKeys
  - `<C-S-A-X>` 在窗口模式和全屏模式下切换
  - `<C-S-A-V>` 将当前主机的剪贴板粘贴到被控端
  - `<C-S-A-D>` 将当前串流窗口最小化
  - `<C-S-A-Q>` 退出当前串流窗口
  - `<C-S-A-F1>` 切换到第一个显示器
  - `<C-S-A-F11>` 切换到第二个显示器
  - `<C-S-A-S>` 显示串流精简信息，可配合 [Moonlight-qt(Axixi)](https://github.com/Axixi2233/moonlight-qt) 使用
  - `<C-S-A-M>` 切换串流窗口鼠标捕获模式

## Ctrl + Alt HotKeys
- Quick Opening
    - `Ctrl + Alt + Q`：打开 QQ
    - `Ctrl + Alt + W`：打开微信
    - `Ctrl + Alt + E`：打开 Edge
    - `Ctrl + Alt + A`：打开 Mathpix
    - `Ctrl + Alt + S`：打开 EverythingToolbar
    - `Ctrl + Alt + D`：打开翻译小窗（使用 [Pot 翻译](https://github.com/pot-app/pot-desktop) 实现）
    - `Ctrl + Alt + C`：打开 VSCode
    - `Ctrl + Alt + O`：打开 Obsidian
    - `Ctrl + Alt + P`：打开 WPS
    - `Ctrl + Alt + N`：打开 NetEase Music
- Coding Feature
    - `Ctrl + Alt + V`: Paste Image
    - `Ctrl + Alt + B`: Build
 
## Win + Ctrl HotKeys
  - `Win + Ctrl + D`: Create a new desktop;
  - `Win + Ctrl + F4`: Delete a existing desktop;
  - `Win + Ctrl + <- / ->`: move to another desktop;
 
## Tools Collection
- [LockLook](https://blog.csdn.net/Steven_Start/article/details/109218714)：一个实时显示 CapsLock、NumLock 等状态的插件
- [KMCounter](https://github.com/telppa/KMCounter): 采用 AutoHotKey 编写的统计键盘信息热力图
- [EverythingToolBar](https://github.com/srwi/EverythingToolbar): 优化至系统内的 [Everything](https://www.voidtools.com/support/everything) 的搜索工具栏
  - 使用 `Win + Alt + S` 唤出
- [AnyTXT](https://anytxt.net): 通过建立索引进行全盘文件内容搜索的工具，使用 `Alt + Q` 呼出
- [Sunshine](https://github.com/LizardByte/Sunshine): N 卡串流必备
- [Moonlight](https://github.com/moonlight-stream/moonlight-qt): 配套 Sunshine 使用
- [ParsecVDD](https://github.com/nomi-san/parsec-vdd): 虚拟显示屏
- [Ditto](https://github.com/sabrogden/Ditto): 优质的剪贴板存储工具
- [PowerToys](https://github.com/microsoft/PowerToys): 目前常使用的功能：
  - `Ctrl + Win + T` 窗口置顶
  - `Ctrl + Space` 速览
- [AudioRelay](https://audiorelay.net/)：可通过 USB 网络共享建立局域网，将电脑音频和手机音频同时在一个蓝牙耳机中进行播放
- [Bluetooth Activity Viewer](https://www.nirsoft.net/utils/bluetooth_viewer.html)：可以实时查看 PC 端检测到的蓝牙设备，查看连接日志
- [WinToys](https://apps.microsoft.com/detail/9p8ltpgcbzxd?launch=true&mode=full&hl=zh-cn&gl=us&ocid=bingwebsearch)：Windows 使用提升

## DSH 配置

[DSH](https://github.com/deepseek-ai/dsh)（DeepSeek Harness）的 Web profile 配置，位于 `DSH/web-profile/`，对应 `~/.dsh/profiles/web/`：

| 文件 | 说明 |
| --- | --- |
| `cordis.yml` | profile 根入口，保持为空数组，实际配置由补丁层叠加 |
| `cordis.patch.yml` | 主要的补丁层：模型供应商、默认模型、权限预设、主题、插件开关 |
| `package.json` | 声明 profile 使用的 bundle |
| `pnpm-workspace.yaml` | pnpm 工作区设置 |

- 模型供应商 `apig` 通过 `apiKeyEnv` 引用环境变量 `APIG_API_KEY`，**密钥不写入配置**，需自行 `export`
- 权限默认 `danger-full-access`，主题 dark、字号 14
- 恢复方式：把 `DSH/web-profile/` 下的文件复制回 `~/.dsh/profiles/web/`，再重启 DSH

## Ghostty 配置

macOS 终端 Ghostty 的配置，位于 `ghostty/config`，对应 `~/.config/ghostty/config`：

- 字体 `JetBrainsMono Nerd Font` 14pt，主题跟随系统深浅色切换 `Catppuccin Mocha / Latte`
- 视觉：`window-padding` 12/10、`background-opacity 0.94` + `background-blur-radius 24`、非焦点分屏变暗
- 光标为闪烁的 block 样式，选中即复制（`copy-on-select = clipboard`）
- 启动即 `tmux new-session`，每个窗口/分屏独立会话，避免多客户端共用同一窗口
- 快捷键：`cmd+t` 新建 tab、`cmd+d` 右侧分屏、`cmd+shift+d` 下方分屏
- 透明标题栏并隐藏左侧 proxy icon

## Karabiner 配置

仅 macOS，位于 `Karabiner/mac/`：

| 文件 | 说明 |
| --- | --- |
| `karabiner.json` | 本机完整配置，对应 `~/.config/karabiner/karabiner.json` |
| `daily.json` | 日常键位规则，含「左 Shift 单击切输入法」 |
| `RemoteControl` | 远控规则（Moonlight 下 Fn→Ctrl、Opt→Win、Cmd→Alt） |

- `daily.json` 比本机 `karabiner.json` 内嵌的 daily 规则多一条：左 Shift 单击 → `Option+Space` 切换输入法，长按 → Shift
- 若要在 Karabiner 中单独导入 `daily.json` / `RemoteControl`，用 Complex Modifications 的「Add rule」从文件添加

## Rime 配置

输入法配置，按前端分平台，**词库与方案为两平台共用**：

- `Rime/` 根目录：`cn_dicts`、`en_dicts`、`lua`、`opencc`、`*.schema.yaml`、`*.dict.yaml`、`default*.yaml`、`user.yaml` 等共用内容
- `Rime/win/`：Windows 小狼毫（Weasel）的 `weasel.yaml`、`weasel.custom.yaml`、`installation.yaml`
- `Rime/mac/`：macOS 鼠须管（Squirrel）的 `squirrel.yaml`、`installation.yaml`

部署时把根目录内容与对应平台子目录一起复制到 Rime 用户目录（Windows 通常是 `%APPDATA%\Rime`，macOS 是 `~/Library/Rime`）。

## starship 配置

按平台分开：

- `starship/win/starship.toml`：Windows 版，十六进制配色，`[os]` 关闭
- `starship/mac/starship.toml`：macOS 版，使用 `catppuccin_mocha` 调色板，对应 `~/.config/starship.toml`

## tmux 配置

仅 macOS，`tmux/mac/tmux.conf`，对应 `~/.config/tmux/tmux.conf`：`Ctrl-a` 前缀、Catppuccin Mocha 状态栏、`window-size latest` 等。Ghostty 启动时会自动 `tmux new-session`。
