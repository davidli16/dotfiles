all: brew git iterm stow

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
	brew cleanup

.PHONY: stow
stow:
	stow .

.PHONY: iterm
iterm:
	defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles"
	defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

.PHONY: git
git: git-submodules

git-submodules:
	git submodule init
	git submodule sync
	git submodule update
