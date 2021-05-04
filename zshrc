
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
# Load Homebrew first
eval $(/opt/homebrew/bin/brew shellenv)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Use this theme from Oh My Zsh
ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

plugins=(
  brew
  gem
  git
  npm
  rails
  redis-cli
  # zsh-syntax-highlighting
)

for file in ~/.zsh/*.zsh; do
  source $file
done

fpath=(`brew --prefix`/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# Load rbenv
#eval "$(rbenv init -)"