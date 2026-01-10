bindkey "^q" clear-screen
bindkey -r "^G"
bindkey "^|" complete-word

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

bindkey '^x^m' man-command-line
