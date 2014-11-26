# Environment
export CLICOLOR="YES"
export TERM="xterm-256color"
export EDITOR="vim"

# Fasd
if (( $+commands[fasd] )); then
  eval "$(fasd --init auto)"
fi

autoload -Uz compinit promptinit colors vcs_info
compinit
promptinit
colors

zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git

# Path
export PATH="$HOME/bin:/usr/local/bin::$PATH"
export PYTHONPATH="$HOME/bin:$PYTHONPATH"
export ANDROID_HOME="/usr/local/opt/android-sdk"

# Commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi="vim -X"

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection

# Features
setopt prompt_subst
setopt share_history
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.history

export PROMPT='
%{$fg_bold[green]%}%%%{$reset_color%} %~
  '
export RPROMPT=' %{$fg_bold[blue]%}${vcs_info_msg_0_}%{$reset_color%}'

bindkey -v
bindkey '^R' history-incremental-search-backward

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
