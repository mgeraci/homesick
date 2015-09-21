# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mgeraci"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm vi-mode)

source $ZSH/oh-my-zsh.sh

# Save and cd into directories
# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
	touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
	command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ;
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
# end Save and cd into directories

# ask first
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# servers
alias dj="ssh mgeraci.dev.okcupid.com"

# update git submodules
alias update_submodules="git submodule foreach git pull origin master"

# stop trying to correct some spellings
alias consular="nocorrect consular"
alias irssi="nocorrect irssi"
alias meteor="nocorrect meteor"
alias glue="nocorrect glue"

# RVM Support
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

# Python virtualenv
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
	source /usr/local/bin/virtualenvwrapper.sh
	export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
fi

# Path
export PATH=/usr/local/git/bin:/usr/local/ruby/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin::/Users/mgeraci/.bin:/usr/local/share/npm/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/mgeraci/.rvm/bin:/Users/mgeraci/local/bin
export NODE_PATH="$HOME/local/lib/node_modules/"

# okcupid settings
SSH_AUTH_SOCK=/var/folders/nx/qrn7hy5j4s76hh65djk_k3dr0000gn/T//ssh-1EmXCOf8IRsA/agent.64514; export SSH_AUTH_SOCK;
SSH_AGENT_PID=64515; export SSH_AGENT_PID;
alias dj="ssh mgeraci.dev.okcupid.com"
alias okfiles="sudo sshfs mgeraci@fileserver:/vol/data1/u0 /nfs/u0"

# okc aliases
if [ -f ~/.okcupid_aliases ]; then
    source ~/.okcupid_aliases
fi
