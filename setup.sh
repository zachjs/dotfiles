#!/bin/zsh

# Author: Zachary Snow <zach@zachjs.com>

# move to the root of the repo
dotfiles_folder=`dirname $0`
cd $dotfiles_folder

# clone submodules
git submodule init
git submodule update

# a whitelist seems more principled here than a blacklist
ITEMS="
    global_gitignore
    gitconfig
    oh-my-zsh
    oh-my-zsh-custom
    rgrc
    vim
    zshrc
"

print_status() {
    status_str=$1
    color=$2
    text=$3
    echo "[\e[${color}m${status_str}\e[0m] $text"
}

handle_item() {
    item=$1

    source="$PWD/$item"
    target="$HOME/.$item"

    if [[ ! -a "$source" ]]; then
        print_status FAIL 31 "$item (missing)"
        exit 1
    fi

    if [[ `readlink "$target"` = "$source" ]]; then
        print_status GOOD 32 $item
        return
    fi

    if [[ -a "$target" ]]; then
        print_status EXST 31 $item
        return
    fi

    ln -s "$source" "$target"
    print_status LINK 33 $item
}

for item in `echo $ITEMS`; do
    handle_item $item
done
