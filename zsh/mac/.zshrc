export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

alias py="source ~/.envs/bin/activate"

# Java (Homebrew OpenJDK)
export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Modern prompt and icon-aware directory listings
# starship 配色跟随 catppuccin_mocha（见 ~/.config/starship.toml）
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
if [[ "$TERM" != "dumb" ]]; then
  eval "$(/opt/homebrew/bin/starship init zsh)"
fi
alias ls="/opt/homebrew/bin/eza --icons=auto --group-directories-first"
alias ll="/opt/homebrew/bin/eza --icons=auto --group-directories-first --long --git"
alias la="/opt/homebrew/bin/eza --icons=auto --group-directories-first --long --all --git"
alias tree="/opt/homebrew/bin/eza --icons=auto --group-directories-first --tree"

# cat 换成 bat：语法高亮，配色跟终端一致的 Catppuccin Mocha
export BAT_THEME="Catppuccin Mocha"
alias cat="/opt/homebrew/bin/bat --plain"
alias less="/opt/homebrew/bin/bat --plain --paging=always"

# zsh 补全增强：灰色联想（→ 接受） + 输入实时着色
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c7086"
fi
# 注意：zsh-syntax-highlighting 必须最后加载，见文件末尾
 # Codex: local proxy for Git and CLI tools
export HTTP_PROXY="http://127.0.0.1:7890"
export HTTPS_PROXY="http://127.0.0.1:7890"
export ALL_PROXY="http://127.0.0.1:7890"
export http_proxy="$HTTP_PROXY"
export https_proxy="$HTTPS_PROXY"
export all_proxy="$ALL_PROXY"
export NO_PROXY="localhost,127.0.0.1,::1"
export no_proxy="$NO_PROXY"

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
# <<< grok installer <<<

# ── 补全系统（必须在所有 fpath 追加之后执行）────────────────
# zsh-completions: 大量命令的参数补全（brew 提供）
[[ -d /opt/homebrew/share/zsh-completions ]] && fpath=(/opt/homebrew/share/zsh-completions $fpath)

autoload -Uz compinit && compinit -C

# Tab 补全行为：候选菜单可用方向键选、大小写不敏感、忽略 . 开头的重复
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' special-dirs true
# 补全菜单配色跟随 Catppuccin Mocha
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 忽略已输入的前缀做模糊匹配，例如 ssh kal<Tab> 能补出 kali-lab
zstyle ':completion:*:hosts' hosts $(grep -E '^Host ' ~/.ssh/config 2>/dev/null | awk '{print $2}')

# ── fzf：Ctrl+R 历史搜索 / Ctrl+T 文件选择 / Alt+C 目录跳转 ──
if [[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

# Default Python: `python` / `pip` use the Homebrew 3.14 user environment
export PATH="$HOME/.venvs/default/bin:/opt/homebrew/opt/python@3.14/libexec/bin:$PATH"

# webscan (ZAP/Nuclei/Nikto)
export PATH="$HOME/bin:$PATH"

# 打开新终端时打印系统信息（每个 tmux 会话只打印一次）
if [[ "$TERM" != "dumb" ]] && [[ -o interactive ]] && [[ -f ~/.config/fastfetch/config.jsonc ]]; then
  if [[ -z "$TMUX" ]]; then
    fastfetch --config ~/.config/fastfetch/config.jsonc
  elif [[ "$(tmux show-options -qv @ff_shown 2>/dev/null)" != "1" ]]; then
    tmux set-option -q @ff_shown 1
    fastfetch --config ~/.config/fastfetch/config.jsonc
  fi
fi

# ─────────────────────────────────────────────────────────
# Kali 靶场快捷入口
#   kali            进 Kali 终端（没开机会自动启动）
#   kali <命令>      在 Kali 里执行单条命令
#   kali-stop       关闭 Kali 虚拟机
#   lab             查看靶场状态
# ─────────────────────────────────────────────────────────
KALI_LAB="$HOME/Downloads/kali-lab"

kali() {
  local lab="$KALI_LAB"
  if [[ ! -d "$lab" ]]; then
    echo "找不到靶场目录: $lab" >&2
    return 1
  fi

  # 虚拟机没跑就先拉起来
  if ! pgrep -f "qemu-system-aarch64.*kali-attacker" >/dev/null 2>&1; then
    echo "⏳ 启动 Kali 虚拟机..."
    ( cd "$lab" && nohup ./scripts/start-kali.sh > logs/kali-console.log 2>&1 & )
    local i
    for i in {1..40}; do
      ssh -i "$lab/lab_key" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
          -o ConnectTimeout=2 -o BatchMode=yes -o LogLevel=ERROR -p 2222 kali@127.0.0.1 true 2>/dev/null && break
      sleep 3
    done
  fi

  ssh -t -i "$lab/lab_key" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
      -o ConnectTimeout=10 -o LogLevel=ERROR -p 2222 kali@127.0.0.1 "$@"
}

kali-stop() {
  pkill -f "qemu-system-aarch64.*kali-attacker" 2>/dev/null \
    && echo "Kali 已关闭（磁盘保留）" || echo "Kali 本来就没在运行"
}

lab() {
  ( cd "$KALI_LAB" && ./scripts/lab.sh status )
}

[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.

# howlto: 用自然语言找命令（Enter 选中后自动填进输入框）
if command -v howlto >/dev/null 2>&1; then
  eval "$(howlto --init)"
fi

# x ask 包装：屏蔽 Claude Code 对非官方模型的调试噪音
# 只过滤那一行，其他 stderr（真实报错）照常输出
xask() { x ask "$@" 2> >(grep -v 'claude-code:unrecognized_model' >&2) }

# ── zsh-syntax-highlighting：必须放在最后 ────────────────────
# 它会包装已注册的 ZLE widget，加载太早会漏掉后建的 widget
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
