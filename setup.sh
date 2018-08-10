#!/bin/zsh

# Author: Zachary Snow (zach@zachjs.com)

# a whitelist seems more principled here than a blacklist
ITEMS="
  gitconfig
  oh-my-zsh
  oh-my-zsh-custom
  vim
  zshrc
"

if [[ "$0" != "./setup.sh" ]]; then
  echo "$0 is not ./setup.sh"
  echo "script must be run from inside the dotfiles repository"
  exit 1
fi

handle_item() {
  item=$1

  source="$PWD/$item"
  target="$HOME/.$item"

  if [[ ! -a "$source" ]]; then
    echo "handle_item: '$item' not present in repository"
    exit 1
  fi

  if [[ -a "$target" ]]; then
    echo "$target already exists, skipping"
    return
  fi

  echo "$source -> $target"
  ln -s "$source" "$target"
}

for item in `echo $ITEMS`; do
  handle_item $item
done
