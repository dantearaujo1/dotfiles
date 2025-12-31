if [[ $(whoami) = 'dante' ]]; then
  bindkey -r "^G"
  bindkey "^q" clear-screen
  bindkey "^|" complete-word
fi

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

bindkey '^x^m' man-command-line
