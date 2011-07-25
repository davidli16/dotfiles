DIR="$( cd "$( dirname "$0" )" && pwd )"

ln -fsv $DIR/.vim ~
ln -fv $DIR/.vimrc ~/.vimrc
ln -fv $DIR/.zshrc ~/.zshrc
ln -fv $DIR/.tmux.conf ~/.tmux.conf

# Git
git config --global user.name "David Li"
git config --global color.ui true
git config --global format.pretty oneline
git submodule sync
git submodule update
