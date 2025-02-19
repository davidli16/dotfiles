eval (/opt/homebrew/bin/brew shellenv)

# Install fisher if it's not available
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Fish
set fish_greeting ''
set -x -g TERM "xterm-256color"

# Path
set -x EDITOR nvim
set -x PIP_REQUIRE_VIRTUALENV true
function gpip
    env PIP_REQUIRE_VIRTUALENV="" pip $argv
end

# Configure FZF
# Use the jellybean color scheme
set -x FZF_DEFAULT_OPTS '
    --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
    --color info:183,prompt:110,spinner:107,pointer:167,marker:215
'
set -gx FZF_DEFAULT_COMMAND  'rg --files'

# Commands
alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'
alias vi 'nvim'

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Install tools
mise activate fish | source
starship init fish | source
zoxide init fish | source
fzf --fish | source
