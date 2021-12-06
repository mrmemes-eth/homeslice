#!/usr/bin/env sh

shopt -s dotglob

for config in $HOME/src/homeslice/dotfiles/*; do
  ln -nsf $config "$HOME/$(basename $config)"
done

shopt -u dotglob