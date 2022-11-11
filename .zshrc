# if [ -z "$TMUX" ]; then
#   exec tmux new-session -A -s workspace
# fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/devdante/.oh-my-zsh"
# zsh -c 'su devdante'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z git zsh-autosuggestions command-not-found extract fzf web-search yum git-extras docker vagrant tmux copyfile copypath common-aliases)

source $ZSH/oh-my-zsh.sh

# User configuration
# FZF - CONFIGURATIONS
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="fd . ."
export FZF_CTRL_T_OPTS=""
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# MAN - CONFIGURATIONS
export MANPAGER='nvim +Man!'
export MANWIDTH=999
# export MANPATH="/usr/local/man:$MANPATH"
export GOLANG_DIR="$HOME/dev/setup/golang/go/bin"
export GOPATH="$HOME/dev/setup/golang/go"
export GOBIN="$GOPATH/bin"
export PROCESSING_DIR="$HOME/dev/setup/processing"
export LOCALBINARIES="$HOME/.local/bin/"
export MYSCRIPTS="$HOME/dev/scripts/"
export PATH=$LOCALBINARIES:$PATH:$PROCESSING_DIR:$GOLANG_DIR:$MYSCRIPTS
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if uname -r | grep -q 'Microsoft'; then

  PATH=$(REMOVE_PART="/mnt/d/Code/NodeJS/" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/c/tools/neovim/Neovim/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/c/Program Files (x86)/Lua/5.1" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/c/Program Files (x86)/Lua/5.1/clibs" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/c/Program Files/dotnet/" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Package Managers/chocolatey/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Languages/Ruby/Ruby27-x64/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Languages/Cmake/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Android/appdata/platform-tools" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Android/appdata/build-tools" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Package Managers/chocolatey/lib/gsudo/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Text Editors/Neovim 64/bin/" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Text Editors/Emacs/x86_64/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Compilers/LLVM/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Compilers/TDM-GCC-64/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/c/Program Files/OpenJDK/openjdk-8u322-b06/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Git/cmd" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/c/Users/dante/AppData/Local/Pandoc/" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/c/Users/dante/.dotnet/tools" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Languages/Processing/" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/f/Programs Files/Texlive/2020/bin/win32" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/LS/lua-language-server/3rd/luamake" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Languages/Python/Python38/Scripts/" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Languages/Python/Python38/" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Package Managers/chocolatey/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Git/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Text Editors/Neovim 64/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Package Managers/chocolatey" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/mnt/d/Code/Android/bin" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')
  PATH=$(REMOVE_PART="/home/devdante/Development/Processing/processing4/build/linux/work" sh -c 'echo ":$PATH:" | sed "s@:$REMOVE_PART:@:@g;s@^:\(.*\):\$@\1@"')

fi

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
alias tmuxconf='$EDITOR $ZSH_TMUX_CONFIG'
alias zz="nvim ~/.zshrc"
alias zZ="source ~/.zshrc"
alias zb="nvim ~/.bashrc"
alias zB="source ~/.bashrc"
alias zsh="nvim ~/.bashrc"
alias zt="nvim ~/.tmux.conf"
alias zT="source ~/.tmux.conf"
alias zn="nvim ~/.config/nvim/lua/init.lua"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias smd="~/dev/projects/processing/smd"
alias lg="lazygit"
alias lgd="lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias cls="clear"
alias fzn="fzf --bind 'f1:execute(dirname {} | cd)' --preview 'batcat --style=numbers --color=always --line-range :500 {}' | xargs nvim"
alias explorer="xdg-open"
alias emulator="/mnt/d/Code/Android/Sdk/emulator/emulator.exe"
alias adb="/mnt/d/Code/Android/Sdk/platform-tools/adb.exe"
alias rdp="sudo /etc/init.d/xrdp start"
alias ustart="~/dev/scripts/vncstart.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
