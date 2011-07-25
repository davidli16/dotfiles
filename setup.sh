DIR="$( cd "$( dirname "$0" )" && pwd )"

rm -v ~/.vim ~/.vimrc ~/.zshrc

ln -fvs $DIR/.vim ~/.vim
ln -fvs $DIR/.vimrc ~/.vimrc
ln -fvs $DIR/.zshrc ~/.zshrc
