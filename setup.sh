DIR="$( cd "$( dirname "$0" )" && pwd )"

ln -fsv $DIR/.vim ~
ln -fsv $DIR/.vimrc ~/.vimrc
ln -fsv $DIR/.zsh ~/.zsh
ln -fsv $DIR/.zshrc ~/.zshrc
ln -fsv $DIR/.tmux.conf ~/.tmux.conf

# Git
git config --global user.name "David Li"
git config --global user.email "davidli@cs.stanford.edu"
git config --global color.ui true
git config --global format.pretty oneline
git config --global push.default simple
git submodule init
git submodule sync
git submodule update

# Vim
vim +PluginInstall +qall
vim +PluginUpdate +qall
