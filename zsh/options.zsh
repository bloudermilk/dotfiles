# Don't share command history data
unsetopt share_history

# Don't tell me what I meant
unsetopt correct_all

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
