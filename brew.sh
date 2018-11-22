#!/usr/bin/env bash
set -e

# Install brew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Freshen brew
brew update
brew upgrade

# Essentials
brew install ctags
brew install fzf
brew install git
brew install shellcheck

# Manage dotfiles
brew install stow

# Manage my runtimes
brew install rbenv
brew install nodenv

# Manage my apps
brew install mas

# Productivity
brew install tmux
brew install tmate
brew install hub
brew install tree
brew install ripgrep
brew install mdp # Markdown presentations on terminal

# Swiss Army Knife
brew install transmission

# Web
brew install ievms

# GUI
brew cask install macvim || true # "... || true" -> continue on error
brew cask install google-chrome || true
brew cask install virtualbox || true # requires sudo
brew cask install virtualbox-extension-pack || true
brew cask install iterm2 || true

# Finally
brew cleanup
