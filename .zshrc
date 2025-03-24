# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p11k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$(whoami)/.oh-my-zsh"
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
HIST_STAMPS="yyyy/mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  git-extras
  zsh-autosuggestions
  command-not-found
  extract
  fzf
  docker
  tmux
  copyfile
  copypath
  common-aliases
  colorize
  autoswitch_virtualenv
)

source $ZSH/oh-my-zsh.sh

# User configuration
# FZF - CONFIGURATIONS
export FZF_DEFAULT_COMMAND="fd . '$HOME' --type f "
export FZF_CTRL_T_COMMAND="fd . ."
export FZF_CTRL_T_OPTS=""
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_TMUX=1
export FZF_TMUX_OPTS="-p 80%,80%"
export FZF_COMPLETION_TRIGGER="**"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"

_fzf_compgen_path(){
  rg --files --glob "!.git" . "$1"
}
_fzf_compgen_dir(){
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
_fzf_complete_git(){
  _fzf_complete -- "$@" < <(
    git --help -a | grep -E '^\s+' | awk '{print $1}'
  )
}

# MAN - CONFIGURATIONS
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export MANPATH="/usr/local/man:$MANPATH"

export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export MYSCRIPTS="$HOME/dev/scripts/"
export FLUTTER_BIN="$HOME/.pub-cache/bin"
export LOCALBINARIES="$HOME/.local/bin/"
export PATH=$LOCALBINARIES:$PATH:$MYSCRIPTS:$FLUTTER_BIN

if [[ $(whoami) = 'dante' ]]; then
  export PAGER=nvimpager
  alias kitheme=kitty +kitten themes
  alias icat='kitty +kitten icat'
  alias cat='bat'
  bindkey -r "^G"
  bindkey "^q" clear-screen
  bindkey "^zc" fzf-git-checkout
  bindkey "^zs" fzf-git-status
  bindkey "^zk" fzf-kill-proc-by-list
  bindkey "^ze" fzf-gitmoji
  bindkey "^[n" fzf-notes
  bindkey "^|" complete-word
  source ~/dev/scripts/fzf-git.sh
  # source ~/dev/scripts/zsh/docker-comp-fzf.zsh
  source ~/dev/scripts/zsh/zsh-fzf-widgets.zsh
  source /usr/share/nvm/init-nvm.sh
fi


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export EDITOR='nvim'

if [ -d "$HOME/.config/hypr/" ];then
  alias binds='nvim ~/.config/hypr/binds.conf'
  alias monitors='nvim ~/.config/hypr/monitors.conf'
  alias initapps='nvim ~/.config/hypr/apps.conf'
  alias rules='nvim ~/.config/hypr/ruleswindow.conf'
  alias hypr='nvim ~/.config/hypr/hyprland.conf'
  alias npypr='nvim ~/.config/hypr/pyprland.conf'
  alias o='xdg-open'
fi
if [ -d "$HOME/.config/qutebrowser/" ];then
  alias qte='nvim ~/.config/qutebrowser/config.py'
fi

alias emp='rm --recursive --verbose --force ~/.local/share/Trash/files/*'
alias ls='lsd'
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
alias zt="nvim ~/.tmux.conf"
alias zT="source ~/.tmux.conf"
alias zn="nvim ~/.config/nvim/lua/init.lua"
alias ohmyzsh="nvim ~/.oh-my-zsh/oh-my-zsh.sh"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias smd="~/dev/projects/processing/smd"
alias lgit="lazygit"
alias ldoc="lazydocker"
alias lsql="lazysql"
alias lgd="lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias cls="clear"
alias f='nvim "$(fzf)"'
alias gvim='nvim --listen ~/.cache/nvim/godot.pipe $*'
alias ndiff='nvim -c DiffviewOpen'
alias fn='files=$(fd . ~/Notes/ --type f | fzf -m --ansi --preview  "bat {}") && [ -n "$files" ] && nvim "$files"  && unset files'
alias fzc='files=$(fd . ~/.config/ --type f | fzf -m --ansi --preview  "bat {}") && [ -n "$files" ] && nvim "$files"  && unset files'
alias fzg="git status --short | grep '^[ M??]' | awk '{print $2}' | fzf --multi"
alias fzf="fzf-tmux -p 80%,80%"
alias fzn="fzf --bind 'f1:execute(dirname {} | cd)' --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim"
alias pacall="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"
alias pacls="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pacd="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(sudo pacman -Rcns {})'"
alias explorer="xdg-open"
alias mindmap="h-m-m"
alias hman="compgen -c | fzf | xargs man"
alias vpy="source ./.venv/bin/activate"
alias cvi="~/dev/scripts/nvim-config.sh "

pdf() {zathura $1 & disown}
mgdir() {mkdir $@ && cd ${@:$#}}
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		      cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

## ATUIN CONFIG
# shellcheck disable=SC2034,SC2153,SC2086,SC2155

# Above line is because shellcheck doesn't support zsh, per
# https://github.com/koalaman/shellcheck/wiki/SC1071, and the ignore: param in
# ludeeus/action-shellcheck only supports _directories_, not _files_. So
# instead, we manually add any error the shellcheck step finds in the file to
# the above line ...

# Source this in your ~/.zshrc
autoload -U add-zsh-hook

zmodload zsh/datetime 2>/dev/null

# If zsh-autosuggestions is installed, configure it to use Atuin's search. If
# you'd like to override this, then add your config after the $(atuin init zsh)
# in your .zshrc
_zsh_autosuggest_strategy_atuin() {
    suggestion=$(ATUIN_QUERY="$1" atuin search --cmd-only --limit 1 --search-mode prefix)
}

if [ -n "${ZSH_AUTOSUGGEST_STRATEGY:-}" ]; then
    ZSH_AUTOSUGGEST_STRATEGY=("atuin" "${ZSH_AUTOSUGGEST_STRATEGY[@]}")
else
    ZSH_AUTOSUGGEST_STRATEGY=("atuin")
fi

export ATUIN_SESSION=$(atuin uuid)
ATUIN_HISTORY_ID=""

_atuin_preexec() {
    local id
    id=$(atuin history start -- "$1")
    export ATUIN_HISTORY_ID="$id"
    __atuin_preexec_time=${EPOCHREALTIME-}
}

_atuin_precmd() {
    local EXIT="$?" __atuin_precmd_time=${EPOCHREALTIME-}

    [[ -z "${ATUIN_HISTORY_ID:-}" ]] && return

    local duration=""
    if [[ -n $__atuin_preexec_time && -n $__atuin_precmd_time ]]; then
        printf -v duration %.0f $(((__atuin_precmd_time - __atuin_preexec_time) * 1000000000))
    fi

    (ATUIN_LOG=error atuin history end --exit $EXIT ${duration:+--duration=$duration} -- $ATUIN_HISTORY_ID &) >/dev/null 2>&1
    export ATUIN_HISTORY_ID=""
}

_atuin_search() {
    emulate -L zsh
    zle -I

    # swap stderr and stdout, so that the tui stuff works
    # TODO: not this
    local output
    # shellcheck disable=SC2048
    output=$(ATUIN_SHELL_ZSH=t ATUIN_LOG=error ATUIN_QUERY=$BUFFER atuin search $* -i 3>&1 1>&2 2>&3)

    zle reset-prompt

    if [[ -n $output ]]; then
        RBUFFER=""
        LBUFFER=$output

        if [[ $LBUFFER == __atuin_accept__:* ]]
        then
            LBUFFER=${LBUFFER#__atuin_accept__:}
            zle accept-line
        fi
    fi
}
_atuin_search_vicmd() {
    _atuin_search --keymap-mode=vim-normal
}
_atuin_search_viins() {
    _atuin_search --keymap-mode=vim-insert
}

_atuin_up_search() {
    # Only trigger if the buffer is a single line
    if [[ ! $BUFFER == *$'\n'* ]]; then
        _atuin_search --shell-up-key-binding "$@"
    else
        zle up-line
    fi
}
_atuin_up_search_vicmd() {
    _atuin_up_search --keymap-mode=vim-normal
}
_atuin_up_search_viins() {
    _atuin_up_search --keymap-mode=vim-insert
}

add-zsh-hook preexec _atuin_preexec
add-zsh-hook precmd _atuin_precmd

zle -N atuin-search _atuin_search
zle -N atuin-search-vicmd _atuin_search_vicmd
zle -N atuin-search-viins _atuin_search_viins
zle -N atuin-up-search _atuin_up_search
zle -N atuin-up-search-vicmd _atuin_up_search_vicmd
zle -N atuin-up-search-viins _atuin_up_search_viins

# These are compatibility widget names for "atuin <= 17.2.1" users.
zle -N _atuin_search_widget _atuin_search
zle -N _atuin_up_search_widget _atuin_up_search

bindkey -M emacs '^r' atuin-search
bindkey -M viins '^r' atuin-search-viins
bindkey -M vicmd '/' atuin-search
bindkey -M emacs '^[[A' atuin-up-search
bindkey -M vicmd '^[[A' atuin-up-search-vicmd
bindkey -M viins '^[[A' atuin-up-search-viins
bindkey -M emacs '^[OA' atuin-up-search
bindkey -M vicmd '^[OA' atuin-up-search-vicmd
bindkey -M viins '^[OA' atuin-up-search-viins
bindkey -M vicmd 'k' atuin-up-search-vicmd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/dante/.dart-cli-completion/zsh-config.zsh ]] && . /home/dante/.dart-cli-completion/zsh-config.zsh || true

