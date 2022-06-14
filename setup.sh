#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install brew and install our main tools
NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle install

mkdir -p ~/.config

# Fish
touch ~/.hushlogin

# Tmux
ln -fshv $DIR/agignore ~/.ignore
ln -fshv $DIR/tmux.conf ~/.tmux.conf
ln -fshv $DIR/config/fish ~/.config/fish

# Nvim
ln -fshv $DIR/vim ~/.vim
ln -fshv $DIR/vimrc ~/.vimrc
ln -fshv $DIR/config/nvim ~/.config/nvim
# Install vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# Git
git config --global user.name "David Li"
git config --global user.email "davidli@cs.stanford.edu"
git config --global color.ui true
git config --global format.pretty oneline
git config --global push.default simple
git config --global pull.rebase true
git config --global alias.a 'commit -a --amend'
git config --global alias.c 'commit -m'
git config --global alias.co 'checkout'
git config --global alias.cp 'cherry-pick'
git config --global alias.l 'log --oneline --graph'
git config --global alias.p 'pull'
git config --global alias.r 'rebase -i HEAD~20'
git config --global alias.rc 'rebase --continue'
git config --global alias.rh 'reset --hard HEAD'
git config --global alias.st 'status'
git config --global alias.su 'submodule update'
git config --global alias.b 'branch'
git submodule init
git submodule sync
git submodule update
