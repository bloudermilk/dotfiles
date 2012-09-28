# Prefer brew-installed binaries over system binaries (specifically, postgres)
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

# Add support for ~/.bin (prefer home binaries over brew binaries)
export PATH=$HOME/.bin:$PATH

export EDITOR="vim"

# Pass escape codes to terminal when using less
export LESS=-R

# Bash configuration
shopt -s globstar autocd
export CLICOLOR=1 # I'm convinced this doesn't do a thing...
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# Git aliases
alias stat="git status"
alias fetch="git fetch"
alias gpr="git pull --rebase"
alias gprp="gpr && git push"

# Tmux aliases
alias ta="tmux attach-session -t"
alias tn="tmux new-session -s"
alias tl="tmux list-sessions"

# Git add all changes, commit.
function gac {
  if [ ! $# -eq 1 ]; then
    echo "Usage: gac <commit message>"
    return
  fi

  git add -A
  git commit -m "$1"
}

# Swap the locations of two files
function swap {
  local tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
  mv "$1" "$tmpfile"
  mv "$2" "$1"
  mv "$tmpfile" "$2"
}

# Navigational aliases
alias u="cdu"
alias r="cdr"
alias p="project"
alias ll="ls -la"

# Other aliases
alias v="vim ."
alias setenv='eval "$(rbenv vars)"'

# Rails
alias log="tail -f log/development.log"
alias restart="touch tmp/restart.txt"

# Profile editing
alias prof="$EDITOR ~/.profile"
alias reprof="source ~/.profile"

# SSH config
alias sshc="vim ~/.ssh/config"

# Restart pow from the command line
function boom {
  kill -9 `ps aux | awk '/Pow/ && !/awk/ { print $2 }'`
}

# Blow that DB up (restarts pow so pg doesn't flip out)
function bigboom {
  boom && bundle exec rake db:schema:load db:seed
}

# Usage: cdu [count=1]
# Where count is the number of directories you want to go up
function cdu {
  for (( c=0; c<${1:-1}; c++ )); do cd ..; done
}

# Description: move up directories until you're a project's root folder
# Usage: cdr
# Notes: Assumes the root of your project is a folder with .git/ in it
function cdr {
  local og_dir=`pwd`
  while [[ `pwd` != "/" ]]; do
    if [ -d .git ]; then return 0; else cd ..; fi
  done
  cd $og_dir && echo Not in a project. You lost, fool?
}


# Description: Moderately robust project navigation
# Usage: project [prefix]
# Where prefix matches the beginning of the name of a folder in $PROJECT_DIR
# If no prefix is specified, changes directory to $PROJECT_DIR
export PROJECT_DIR=~/Projects
function project {
  if [[ -z $1 ]]; then cd $PROJECT_DIR; ls; return 0; fi
  local projects=`ls $PROJECT_DIR | grep ^$1`
  if [[ $projects == "" ]]; then echo "No matching projects"; return 0; fi
  if [[ `echo "$projects" | wc -l` == "       1" ]]; then
    cd $PROJECT_DIR/$projects/$2; return 0;
  fi
  echo Too vague. Matched the following projects:
  echo $projects
}

# Use local SSH keys when SSH'd into a server
export SSH_ENV=$HOME/.ssh/environment
function start_agent() {
  echo "Initializing new SSH agent...";
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > $SSH_ENV;
  chmod 600 $SSH_ENV;
  . $SSH_ENV;
  /usr/bin/ssh-add;
}


# Custom prompt. In the format:
# CURRENT_DIRECTORY [(GIT_BRANCH)]$
export PS1='\W $(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\]($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi)$ '

# Load VirtualENV
#source /usr/local/bin/virtualenvwrapper.sh

# Load bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Load rbenv
eval "$(rbenv init -)"
