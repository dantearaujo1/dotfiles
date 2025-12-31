# FZF - CONFIGURATIONS
export FZF_DEFAULT_COMMAND="fd . '$HOME' --type f "
export FZF_CTRL_T_COMMAND="fd . ."
export FZF_CTRL_T_OPTS=""
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_TMUX=1
export FZF_TMUX_OPTS="-p 80%,80%"
export FZF_COMPLETION_TRIGGER="**"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"

# MAN - CONFIGURATIONS
export MANWIDTH=999

export MANPAGER='nvim +Man!'
export MANPATH="/usr/local/man:$MANPATH"
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export EDITOR='nvim'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export PYENV_ROOT="$HOME/.pyenv"
export MYSCRIPTS="$HOME/dev/scripts/"
export FLUTTER_BIN="$HOME/.pub-cache/bin"
export LOCALBINARIES="$HOME/.local/bin/"
export PATH=$LOCALBINARIES:$PATH:$MYSCRIPTS:$FLUTTER_BIN

if [[ $(whoami) = 'dante' ]]; then
  export PAGER=nvimpager
fi
[[ -f /home/dante/.dart-cli-completion/zsh-config.zsh ]] && . /home/dante/.dart-cli-completion/zsh-config.zsh || true
