#!/usr/bin/bash

# Prefer brew-installed binaries over system binaries (specifically, postgres)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add support for ~/.bin (prefer home binaries over brew binaries)
export PATH=$HOME/.bin:$PATH

# Support globally-installed NPM modules
export PATH=$PATH:/usr/local/share/npm/bin

# Use the locally-installed pilot
export PATH=$PATH:$HOME/Projects/pilot/bin

# <3 vim
export EDITOR="vim"

# cd to projects anywhere
export CDPATH=".:~/Projects"

# Pass escape codes to terminal when using less
export LESS=-RS

# Print CPU usage statistics for any command that runs more than 5 seconds
export REPORTTIME=5

# SSL cert courtesy of: brew install curl-ca-bundle
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem

# Don't auto-bundle exec certain gems
export NOEXEC_EXCLUDE="zeus"
