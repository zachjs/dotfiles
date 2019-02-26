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
    # setup golang installation path
    export GOPATH="~/.go"
    # executable search PATH
    export PATH=$PATH:/usr/local/sbin
    export PATH=$PATH:/opt/c0/bin
    export PATH=$PATH:$GOPATH/bin
    # kerberos auth to allow password-less SSH login and SCP tab completion
    kinit -k &> /dev/null

# setup for other machines
else
    # echo "Host not specified in .zshrc!"
fi

# add certain CMU courses' binaries to the search path
if [[ -d /afs/andrew/course ]]; then
    export PATH=$PATH:/afs/andrew/course/15/122/bin
    export PATH=$PATH:/afs/andrew/course/15/150/bin
    export PATH=$PATH:/afs/andrew/course/15/210/bin
fi

# add 15-410 public binaries and staff scripts/binaries to the search path
if [[ -d ~/410 ]]; then
    export PATH=$PATH:~/410/bin
    export PATH=$PATH:~/410/private/scripts
    export PATH=$PATH:~/410/private/bin
fi

# add VCS to the search path on the ECE cluster
if [[ $HOST == ece*.ece.local.cmu.edu ]]; then
    source /afs/ece/class/ece240/bin/setup_vcs
fi

# login to the cs.cmu.edu AFS cell, if available
if [[ -d /afs/cs.cmu.edu && "$USER" = "zsnow" ]]; then
    aklog cs.cmu.edu
fi
