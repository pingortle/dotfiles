#!/usr/bin/env bash
set -e

# Install brew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Freshen brew
brew update
brew upgrade

# Essentials
brew install git

# Manage dotfiles
brew install stow

# Manage my runtimes
brew install rbenv
brew install nodenv

# Productivity
brew install tmux
brew install hub
brew install tree
brew install ripgrep

# Web
brew install ievms

# GUI
brew cask install macvim || true # "... || true" -> continue on error
brew cask install google-chrome || true
brew cask install virtualbox || true # requires sudo
brew cask install virtualbox-extension-pack || true

# Finally
brew cleanup
