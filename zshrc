# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=1

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.zsh/options.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/aliases.zsh

# Load rbenv
eval "$(rbenv init -)"

# Pilot
PATH=$HOME/Projects/pilot/bin:$PATH
eval "$(pilot init -)"
