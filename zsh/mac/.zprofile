eval "$(/opt/homebrew/bin/brew shellenv)"

# Default Python: `python` / `pip` use the Homebrew 3.14 user environment
export PATH="$HOME/.venvs/default/bin:/opt/homebrew/opt/python@3.14/libexec/bin:$PATH"
