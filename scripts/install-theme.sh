#!/usr/bin/env bash

set -e

echo ">> Installing dependencies..."
sudo apt update
sudo apt install -y zsh eza bat btop curl unzip wget

echo ">> Installing Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
cd "$FONT_DIR"

if [ ! -f "JetBrainsMonoNerdFont-Regular.ttf" ]; then
  wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip -o JetBrainsMono.zip > /dev/null
  rm JetBrainsMono.zip
  fc-cache -fv > /dev/null
fi

echo ">> Installing Starship..."
if ! command -v starship &> /dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo ">> Setting Zsh as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s "$(which zsh)"
fi

echo ">> Copying WezTerm config..."
mkdir -p "$HOME/.config/wezterm"
cp wezterm.lua "$HOME/.wezterm.lua"

echo ">> Copying Starship config..."
mkdir -p "$HOME/.config"
cp starship.toml "$HOME/.config/starship.toml"

echo ">> Updating .zshrc..."
if ! grep -q "CYBERPUNK_THEME" "$HOME/.zshrc"; then
  echo "" >> "$HOME/.zshrc"
  echo "# CYBERPUNK_THEME" >> "$HOME/.zshrc"
  cat zshrc.append >> "$HOME/.zshrc"
fi

echo ""
echo "Installation complete."
echo "Restart your terminal."