# Git
alias stat="git status"
alias fetch="git fetch"
alias gpr="git pull --rebase"
alias gprp="gpr && git push"

# Tmux
alias ta="tmux attach-session -t"
alias tn="tmux new-session -s"
alias tl="tmux list-sessions"

# Navigational
alias p="cd ~/Projects"
alias u="cdu"
alias r="cdr"
alias ll="ls -la"

# Rails
alias log="tail -f log/development.log"
alias restart="touch tmp/restart.txt"

# SSH config
alias sshc="vim ~/.ssh/config"

# MAC manipulators
alias random_mac='sudo ifconfig en0 ether `openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/.$//"`'
alias restore_mac='sudo ifconfig en0 ether YOUR_ORIGINAL_MAC_ADDRESS_GOES_HERE'

# Other aliases
alias v="vim ."
alias dopython="source /usr/local/bin/virtualenvwrapper.sh"
