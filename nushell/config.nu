# Location: \\AppData\\Roaming\\nushell\\config.nu
# cli: > vim $nu.config-path

# config.nu
#
# Installed by:
# version = "0.104.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# Define Alias
alias vim = nvim

# Remove Welcome Banner
$env.config.show_banner = false

# Set Proxy
def --env "proxy set" [] {
    load-env { "HTTP_PROXY": "http://localhost:7890", "HTTPS_PROXY": "http://localhost:7890" }
}

proxy set

def --env "proxy unset" [] {
    load-env { "HTTP_PROXY" : "", "HTTPS_PROXY": ""}
}

# Use Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")