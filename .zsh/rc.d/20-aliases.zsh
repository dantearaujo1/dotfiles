if [ -d "$HOME/.config/hypr/" ];then
  alias binds='nvim ~/.config/hypr/binds.conf'
  alias hypr='nvim ~/.config/hypr/hyprland.conf'
  alias initapps='nvim ~/.config/hypr/apps.conf'
  alias monitors='nvim ~/.config/hypr/monitors.conf'
  alias npypr='nvim ~/.config/hypr/pyprland.conf'
  alias rules='nvim ~/.config/hypr/ruleswindow.conf'
fi

if [ -d "$HOME/.config/qutebrowser/" ];then
  alias qte='nvim ~/.config/qutebrowser/config.py'
fi

if [[ $(whoami) = 'dante' ]]; then
  alias cat='bat -p'
  alias icat='kitty +kitten icat'
  alias themes='kitty +kitten themes'
fi

alias cls="clear"
alias cvi="~/dev/scripts/nvim-config.sh "
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias emp='rm --recursive --verbose --force ~/.local/share/Trash/files/*'
alias explorer="xdg-open"
alias f='nvim "$(fzf)"'
alias fn='files=$(fd . ~/Notes/ --type f | fzf -m --ansi --preview  "bat {}") && [ -n "$files" ] && nvim "$files"  && unset files'
alias fzc='files=$(fd . ~/.config/ --type f | fzf -m --ansi --preview  "bat {}") && [ -n "$files" ] && nvim "$files"  && unset files'
alias fzf="fzf-tmux -p 80%,80%"
alias fzg="git status --short | grep '^[ M??]' | awk '{print $2}' | fzf --multi"
alias fzn="fzf --bind 'f1:execute(dirname {} | cd)' --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim"
alias gvim='nvim --listen ~/.cache/nvim/godot.pipe $*'
alias hman="compgen -c | fzf | xargs man"
alias ldoc="lazydocker"
alias lgd="lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias lgit="lazygit"
alias ls='lsd'
alias lsql="lazysql"
alias mindmap="h-m-m"
alias ndiff='nvim -c DiffviewOpen'
alias o='xdg-open'
alias ohmyzsh="nvim ~/.oh-my-zsh/oh-my-zsh.sh"
alias pacall="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"
alias pacd="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(sudo pacman -Rcns {})'"
alias pacde="pacman -Qe | awk '{print \$1;}' | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(sudo pacman -Rcns {})'"
alias pacls="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias paclse="pacman -Qe | awk '{print \$1;}' | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias tkss='tmux kill-session -t'
alias tksv='tmux kill-server'
alias tl='tmux list-sessions'
alias ts='tmux new-session -s'
alias tt='taskwarrior-tui'
alias vpy="source ./.venv/bin/activate"
alias zB="source ~/.bashrc"
alias zT="source ~/.tmux.conf"
alias zZ="source ~/.zshrc"
alias zb="nvim ~/.bashrc"
alias zn="nvim ~/.config/nvim/lua/init.lua"
alias zt="nvim ~/.tmux.conf"
alias zz="nvim ~/.zshrc"

[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# FUNCTIONS ================================================================
function pdf() {
  zathura $1 & disown
}
function mgdir() {
  mkdir $@ && cd ${@:$#}
}
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		      cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
