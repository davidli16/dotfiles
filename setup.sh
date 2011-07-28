DIR="$( cd "$( dirname "$0" )" && pwd )"

#ZSH
wget --no-check-certificate https://github.com/Ghiblian/oh-my-zsh/raw/master/tools/install.sh -O - | sh

ln -fsv $DIR/.vim ~
ln -fsv $DIR/.vimrc ~/.vimrc
ln -fsv $DIR/.zshrc ~/.zshrc
ln -fsv $DIR/.tmux.conf ~/.tmux.conf

# Git
git config --global user.name "David Li"
git config --global color.ui true
git config --global format.pretty oneline
git submodule sync
git submodule update
