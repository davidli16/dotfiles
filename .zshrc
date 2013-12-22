fpath=(~/.zsh/functions $fpath)

if [[ -f /etc/profile ]]; then
  source /etc/profile
fi

if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

if [[ -f /etc/bash_completion.d/g4d ]]; then
  source /etc/bash_completion.d/g4d
fi

# Environment
export CLICOLOR="YES"
export TERM="xterm-256color"

# Start TMUX at launch
if (( $+commands[tmux] )); then
  if [[ -z "$TMUX" ]]; then
    # if no session is started, start a new session
    tmux attach -d || tmux new; exit

    # when quitting tmux, try to attach
    while [[ -z ${TMUX} ]]; do
      (tmux has-session && tmux attach -d) || break
    done
  fi
fi

# Fasd
if (( $+commands[fasd] )); then
  fasd --init auto
fi

autoload -Uz compinit promptinit colors vcs_info
compinit
promptinit
colors

zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn

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
setopt prompt_subst
setopt share_history
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.history
setopt APPEND_HISTORY

export PROMPT='
%{$fg_bold[green]%}%%%{$reset_color%} %~
  '
export RPROMPT=' %{$fg_bold[blue]%}${vcs_info_msg_0_}%{$reset_color%}'

# Lifecycle
precmd() {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
      zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{blue}]'
  } else {
      zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{red}●%F{blue}]'
  }
  vcs_info
  printf "\033k[$(git_branch)]\033\\"
}

preexec() {
  printf "\033k[$(git_branch)*]\033\\"
}

# Utilities
git_branch() {
  BRANCH_REFS=$(git symbolic-ref HEAD 2>/dev/null) || return
  GIT_BRANCH="${BRANCH_REFS#refs/heads/}"
  [ -n "$GIT_BRANCH" ] && echo "$GIT_BRANCH"
}
