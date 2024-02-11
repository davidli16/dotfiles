all: brew git nvim stow

# ------------
# Homebrew
# ------------
brew: Brewfile.lock.json

.PHONY: install-brew
install-brew:
	NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/opt/homebrew/bin/brew shellenv)"

Brewfile: install-brew

Brewfile.lock.json: Brewfile
	brew bundle install

# ------------
# Neovim
# ------------
.PHONY: nvim
nvim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall +qall

# ------------
# Stow
# ------------
.PHONY: stow
stow:
	stow .

# ------------
#  Git
# ------------
.PHONY: git
git: git-submodules

git-submodules:
	git submodule init
	git submodule sync
	git submodule update
