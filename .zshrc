if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p11k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/$(whoami)/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

HIST_STAMPS="yyyy/mm/dd"
plugins=(
  z
  zsh-autosuggestions
  zsh-interactive-cd
  command-not-found
  extract
  docker
  copyfile
  copypath
  common-aliases
  colorize
  autoswitch_virtualenv
  man
  sudo
)
source $ZSH/oh-my-zsh.sh

# --- Load modular config files ---
ZSHRC_DIR="${XDG_CONFIG_HOME:-$HOME}/.zsh"
ZSHRC_D_DIR="$ZSHRC_DIR/rc.d"

# Load in order (10-*, 20-*, etc.)
for f in "$ZSHRC_D_DIR"/*.zsh(N); do
  source "$f"
done

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - -zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
