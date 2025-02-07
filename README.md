# dotFiles
Stores Deralive's configuration files.

## VSCode 配置

于左下角 `设置->配置文件` 中可以直接导入 `vscode-config.code-profile`，可以一键配置：
- Plugins、Key Bindings、Themes、Workspace
- 特色:
    - 使用 LLVM 实现走 Clang++ 编译 C++ 代码
    - 使用不同的 LSP + ErrorLen 插件实现代码报错提示
    - 使用 Double Lines 插件为 Vim 实现 Relative Line 显示
    - 配置 Prettier 以为不同语言配置不同的代码格式化方式
    - 实现 Markdown 编辑器显示侧边预览
- Key Bindings:
    - 使用 Ctrl + Alt + L 看齐 Jetbrains 代码格式化
    - 使用 Ctrl + R 看齐 Jetbrains 代码替换
    - Todo: 使用 Shift + F6 看齐变量名重构

## PixPin 配置
一款优秀的截图软件，使用 ALt + A 截图。

## Vimium C 配置
基于 Chrome 内核的浏览器使用的 Vim 插件，删除不必要的键位，适配逻辑操作：

### 基础操作
- 使用 Shift + H/L 移动至左/右侧标签页
- 使用 Ctrl + J/K 向上下移动半页
- 使用 r 键刷新子网页，取消静态资源多加载的情况
- 使用 yy 复制当前网页的 url，基于此可使用 yyp 快速复制标签页
- 使用 gi 选择网站中的文本框
- 使用 gu 访问网站的上一层
- 使用 yi 复制图片至剪贴板
- 使用 << 和 >> 进行前进和后退

### 搜索框
- **o**: 搜索混合内容并在新标签页打开
- **b**: 搜索已隐藏内容并在新标签页打开
- **T**: 在所有标签页中搜索

### 标签页和窗口
- **L**: 切换到右侧标签页
- **H**: 切换到左侧标签页
- **<c-n>**: 打开新的标签页
- **x**: 关闭当前标签页
- **gu**: 访问上一层网站
- **gi**: 进入输入框选择模式

## 其他功能
- **yy**: 复制当前网页的 URL
- **yyp**: 快速复制标签页
- **yi**: 复制图片到剪贴板
- **<c-w>**: 移动到当前标签页的下一个窗口
- **<a->**: 切换到最近访问的上一个标签页
