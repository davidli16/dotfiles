# Fish
set fish_greeting ''
set -x -g TERM "xterm-256color"

# Path
set ANDROID_HOME ~/Library/Android/sdk
set YARN_BIN (yarn global bin)
set PATH \
    /usr/local/bin \
    $YARN_BIN \
    $ANDROID_HOME/tools \
    $ANDROID_HOME/platform-tools \
    $PATH
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
# Use AG as the fuzzyfinder
set -x FZF_DEFAULT_COMMAND 'ag --hidden --path-to-ignore ~/.ignore --ignore .git -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND"

# Commands
alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'
alias vi 'nvim'
alias rbpost 'rbt-log-post --parent=HEAD~1'
alias tm 'tmux -CC attach; or tmux -CC'
alias title 'tmux rename-window'

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_cleanstate '✔'
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_untrackedfiles 'u'
set __fish_git_prompt_char_stashstate 's'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
