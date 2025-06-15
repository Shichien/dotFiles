# dotFiles
Stores Deralive's configuration files.
仅供自查，可参考配置。

## VSCode 配置

于左下角 `设置->配置文件` 中可以直接导入 `vscode-config.code-profile`，可以一键配置：
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

## PixPin 配置
一款优秀的截图软件，使用 `ALt + A` 截图。

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
  - 可选项有 Bing、Youtube、Github、Wiki、Bilibili、All
  - 在输入 `All <Content>` 后同时开启五个搜索引擎
  - 在输入 `cmd <Command>` 后可以快速执行 Powershell 命令
- `CapsLock + O / Enter`，模仿 Vim 模式新建一行
- `CapsLock + I / A`，模仿 Vim 模式进入行首和行尾（模拟 `Home`、`End`）
- `CapsLock + Backspace`，模仿 Vim 模式删除一行
- `CapsLock + W`，快速打开一个在桌面上创建的记事本

## Others
- `Ctrl + Alt + W`：打开微信
- `Ctrl + Alt + M`：打开翻译小窗（使用 [有道翻译](https://fanyi.youdao.com/download-Windows/) 实现）
- 使用 `Ctrl+ Win + T` 置顶当前窗口
- 在文件夹中使用 `Ctrl + Space` 进行文件速览（基于 PowerToys）
- [AltSnap](https://github.com/RamonUnch/AltSnap)：按住 `Alt` 键拖动或缩放窗口
- [Alt-Tab Terminator](https://www.ntwind.com/software/alttabter.html)：更好的 `Alt-Tab`
- 可以使用 `Alt + Esc` 键快速在两个窗口之间切换

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

## Windows HotKeys
- `Win + E`, `Win + R`, `Win + I`, `Win + P`, `Win + G`, `Win + H`, `Win + Z`, `Win + X`, `Win + V`, `Win + B`

## Moonlight HotKeys
  - `<C-S-A-X>` 在窗口模式和全屏模式下切换
  - `<C-S-A-V>` 将当前主机的剪贴板粘贴到被控端
  - `<C-S-A-D>` 将当前串流窗口最小化
  - `<C-S-A-Q>` 退出当前串流窗口
  - `<C-S-A-F1>` 切换到第一个显示器
  - `<C-S-A-F11>` 切换到第二个显示器
  - `<C-S-A-S>` 显示串流精简信息，可配合 [Moonlight-qt(Axixi)](https://github.com/Axixi2233/moonlight-qt) 使用
  - `<C-S-A-M>` 切换串流窗口鼠标捕获模式
