# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

plugins=(
  brew
  coffee
  gem
  git
  lein
  npm
  rails3
  redis-cli
  vagrant
  zsh-syntax-highlighting
)

fpath=(`brew --prefix`/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

for file in ~/.zsh/*.zsh; do
  source $file
done

# Load rbenv
eval "$(rbenv init -)"

# Pilot
PATH=$HOME/Projects/pilot/bin:$PATH
eval "$(pilot init -)"
