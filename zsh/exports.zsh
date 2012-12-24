#!/usr/bin/bash

# Prefer brew-installed binaries over system binaries (specifically, postgres)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add support for ~/.bin (prefer home binaries over brew binaries)
export PATH=$HOME/.bin:$PATH

# Support globally-installed NPM modules
export PATH=$PATH:/usr/local/share/npm/bin

# <3 vim
export EDITOR="vim"

# cd to projects anywhere
export CDPATH=".:~:~/Projects"

# Pass escape codes to terminal when using less
export LESS=-R
