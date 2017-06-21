#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

ln -fshv $DIR/vim ~/.vim
ln -fshv $DIR/vimrc ~/.vimrc
ln -fshv $DIR/tmux.conf ~/.tmux.conf
ln -fshv $DIR/config/fish ~/.config/fish

# Git
git config --global user.name "David Li"
git config --global user.email "davidli@cs.stanford.edu"
git config --global color.ui true
git config --global format.pretty oneline
git config --global push.default simple
git config --global pull.rebase true
git config --global alias.a 'commit -a --amend'
git config --global alias.c 'commit -m'
git config --global alias.l 'log --oneline --graph'
git config --global alias.r 'rebase -i HEAD~20'
git submodule init
git submodule sync
git submodule update

# Vim
vim +PluginInstall +qall
.vim/bundle/YouCompleteMe/install.sh --clang-completer
