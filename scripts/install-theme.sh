#!/usr/bin/env bash
set -e

# ===== FORÇA SUDO NO INÍCIO =====
if [ "$EUID" -ne 0 ]; then
  echo "Reexecutando com sudo..."
  exec sudo bash "$0" "$@"
fi

echo "------ Instalando Cyberpunk 2077 Theme ------"

USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")

WEZTERM_DIR="$USER_HOME/.config/wezterm"
STARSHIP_DIR="$USER_HOME/.config"

# ===== VERIFICA / CRIA DIRETÓRIOS =====
if [ ! -d "$WEZTERM_DIR" ]; then
  echo "Criando diretório WezTerm..."
  mkdir -p "$WEZTERM_DIR"
fi

if [ ! -d "$STARSHIP_DIR" ]; then
  echo "Criando diretório .config..."
  mkdir -p "$STARSHIP_DIR"
fi

# ===== COPIA ARQUIVOS COM VALIDAÇÃO =====
if [ -f "wezterm/wezterm.lua" ]; then
  cp wezterm/wezterm.lua "$WEZTERM_DIR/"
  echo "WezTerm configurado."
else
  echo "Arquivo wezterm.lua não encontrado."
fi

if [ -f "shell/.zshrc" ]; then
  cp shell/.zshrc "$USER_HOME/"
  echo ".zshrc instalado."
fi

if [ -f "shell/.bashrc" ]; then
  cp shell/.bashrc "$USER_HOME/"
  echo ".bashrc instalado."
fi

if [ -f "starship/starship.toml" ]; then
  cp starship/starship.toml "$STARSHIP_DIR/"
  echo "Starship configurado."
fi

# ===== AJUSTA PERMISSÕES PARA O USUÁRIO ORIGINAL =====
chown -R "${SUDO_USER:-$USER}":"${SUDO_USER:-$USER}" "$USER_HOME/.config" || true

echo "------ Instalação concluída com sucesso ------"
