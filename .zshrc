export PATH="/opt/homebrew/bin:$PATH"

# Commands
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias vi="nvim"

# Plugins
source ~/.config/zsh/plugins/zsh-z/zsh-z.plugin.zsh

autoload -U compinit; compinit
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
