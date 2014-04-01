#!/usr/bin/env bash

# SHOULD BE RUN AFTER PHP INSTALL

echo "--- Installing zsh ---"
sudo apt-get install -y zsh

echo "--- Installing OhMyZsh ---"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

touch .aliases

REPLACE_ANCHOR="# Example aliases"
REPLACE_STR="./.aliases\n\nREPLACE_ANCHOR"

sed -i "s/$REPLACE_ANCHOR/$REPLACE_STR/" .zshrc

# Add Aliases
cat << EOF >> .aliases
alias la="ls -la"
alias ..="cd .."

# Laravel Aliases
alias art="php artisan"
EOF

# set theme
sed -i "s/ZSH_THEME=\".+\"/ZSH_THEME=\"jnrowe\"/" .zshrc

sudo chsh -s $(which zsh) vagrant
