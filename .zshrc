fpath=(~/.zsh/functions $fpath)

# Environment
export CLICOLOR="YES"
export TERM="screen-256color"

autoload -U compinit promptinit colors
compinit
promptinit
colors

# Path
export PATH="$HOME/bin:$PATH"
export PYTHONPATH="$HOME/bin:$PYTHONPATH"

# Commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi="vim -X"

# Features
setopt share_history
SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/.history
setopt APPEND_HISTORY

source /etc/profile
source ~/.bash_aliases
source ~/bin/autojump.zsh

# Start TMUX at launch
if [[ -z "$TMUX" ]]; then
  tmux att
fi

export PS1="[%{$fg_bold[green]%}%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}] %{$reset_color%}"
