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

### sketchybar dependencies
brew install switchaudio-osx
brew install nowplaying-cli

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
cd "$HOME"
[ ! -d "$HOME/dotfiles" ] && git clone https://github.com/vrpsc/dotfiles.git
cd "$HOME/dotfiles"
mv "$HOME/dotfiles/.config/*" "$HOME/.config"
mv "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
mv "$HOME/dotfiles/.p10k.zsh" "$HOME/.p10k.zsh"
mv "$HOME/dotfiles/tmux-sessionizer" "$HOME/.local/scripts/tmux-sessionizer"
mv "$HOME/dotfiles/shortcuts.zsh" "$HOME/.oh-my-zsh/custom/shortcuts.zsh"
rm -rf "$HOME/dotfiles"

# nvm setup
echo "Setting up nvm..."
mkdir -p "$HOME/.nvm"
nvm install node

# Sketchybar setup
echo "Setting up Sketchybar..."
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)

# powerlevel10k setup
echo "Setting up Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# zsh plugin setup
echo "Setting up ZSH Plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh
source "$HOME/.zshrc"

# Start Services
echo "Starting Services (grant permissions)..."
brew services start sketchybar
yabai --start-service
skhd --start-service
sketchybar --reload

echo "Installation Complete!\n"
