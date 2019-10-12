# Author: Zachary Snow <zach@zachjs.com>

# path to oh my zsh installation
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~/.oh-my-zsh-custom

# zsh settings
ZSH_THEME="zachjs"        # provides a custom prompt loosely based on "simple"
HYPHEN_INSENSITIVE="true" # '_' and '-' are interchangeable WRT tab completion
COMPLETION_WAITING_DOTS="true" # display red dots while waiting for completion

# zsh plugins
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

# even more command-specific autocompletion (e.g., go, bower)
fpath=(/usr/local/share/zsh-completions $fpath)

# start oh my zsh
source $ZSH/oh-my-zsh.sh

# other random environment variables
export EDITOR='vim' # used by some programs when opening an editor
export LANG=en_US.UTF-8 # language environment

# personal aliases
# TODO This isn't really an alias....
alias cleantex="ls *.tex | sed -E -e 's/ /\n/' -e 's/^(.+).tex\$/\1.aux \1.log \1.synctex.gz \1.fdb_latexmk \1.fls \1.out \1.dvi/' | xargs rm 2> /dev/null"

# TODO: Could use `if [[ -n $SSH_CONNECTION ]]` to case on zsh running over SSH

# personal laptop settings
if [[ "$HOST" = "zachs-mbp" ]]; then
    # executable search paths
    export PATH=$PATH:/usr/local/sbin
    export PATH=$PATH:~/.local/bin

# setup for other machines
else
    # echo "Host not specified in .zshrc!"
fi
