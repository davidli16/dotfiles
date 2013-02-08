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
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.history
setopt APPEND_HISTORY

if [[ -f /etc/profile ]]; then
  source /etc/profile
fi

if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

if [[ -f ~/bin/autojump.zsh ]]; then
  source ~/bin/autojump.zsh
fi

if [[ -f ~/.autojump/etc/profile.d/autojump.zsh ]]; then
  source ~/.autojump/etc/profile.d/autojump.zsh
fi

if [[ -f /etc/bash_completion.d/g4d ]]; then
  source /etc/bash_completion.d/g4d
fi

# Start TMUX at launch
if [[ -z "$TMUX" ]]; then
  # if no session is started, start a new session
  tmux attach -d || tmux new; exit

  # when quitting tmux, try to attach
  while [[ -z ${TMUX} ]]; do
    (tmux has-session && tmux attach -d) || break
  done
fi

parse_git_branch () {
  git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}

export PROMPT="
%{$fg_bold[green]%}%%%{$reset_color%} %~
  "
export RPROMPT=" %{$fg_bold[blue]%}$(parse_git_branch)%{$reset_color%}"
