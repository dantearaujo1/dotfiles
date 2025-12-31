# --- Completion bootstrap (clean + fast) ---

# Your custom completions
fpath=(~/.zsh/completions $fpath)

autoload -Uz compinit

# Cache dump in your own cache dir
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-${ZSH_VERSION}"

# Use cached completion if dump exists
compinit -d "$ZSH_COMPDUMP" -C

# Useful defaults (optional)
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# Lazy-load qlik completion on first completion attempt
_qlik_lazy_load() {
  unfunction _qlik_lazy_load
  autoload -Uz _qlik
  compdef _qlik qlik
}
compdef _qlik_lazy_load qlik
