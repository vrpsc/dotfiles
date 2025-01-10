#!/bin/zsh

# Install xCode cli tools
xcode-select --install

# Homebrew
## Install
echo "Install Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

## Formulae
echo "Installing Brew Formulae..."
### Essentials
brew install wget
brew install curl
brew install jq
brew install ripgrep
brew install gh
brew install skhd
brew install sketchybar
brew install yabai
brew install nvm

### Terminal
brew install neovim
brew install fzf
brew install tmux
brew install btop

### Developing
brew install clang-format
brew install python
brew install lua

## Casks
echo "Installing Brew Casks..."
### Terminals and Browsers
brew install --cask alacritty
brew install --cask arc
brew install --cask google-chrome
brew install --cask kitty

### Developer Tools
brew install --cask vscode
brew install --cask virtualbox
brew install --cask docker

### Utilities
brew install --cask monitorcontrol
brew install --cask raycast
brew install --cask smcfancontrol
brew install --cask sf-symbols
brew install --cask zoom
brew install --cask notion
brew install --cask drawio

### Fonts
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-mono
brew install --cask font-sf-pro

# oh-my-zsh
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# config files
echo "Planting Configuration Files..."
