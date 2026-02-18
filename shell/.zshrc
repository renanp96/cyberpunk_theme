# ----------------------------
# Aliases Cyberpunk
# ----------------------------

# Se tiver eza instalado (melhor que ls)
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first --color=always'
  alias ll='eza -lah --icons --group-directories-first'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
fi

# ----------------------------
# Starship Prompt
# ----------------------------
eval "$(starship init zsh)"

# ----------------------------
# SDKMAN (DEVE SER O ÚLTIMO)
# ----------------------------
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

