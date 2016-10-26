# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mgeraci"

source $ZSH/oh-my-zsh.sh


# ask first
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias lla="ls -la"

# git shortcut for the lazy
alias g="git"
alias bd="git diff --name-status master... | sort"

# newer, brewed version of vim
alias vi="vim"

# update git submodules
alias update_submodules="git submodule foreach git pull origin master"

# stop trying to correct some spellings
alias consular="nocorrect consular"
alias irssi="nocorrect irssi"
alias meteor="nocorrect meteor"
alias glue="nocorrect glue"

alias f="ack"

# rvm support
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

# python virtualenv
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
	source /usr/local/bin/virtualenvwrapper.sh
fi

# path
export PATH=/usr/local/git/bin:/usr/local/ruby/bin:/usr/local/bin:/usr/local/sbin:/Users/mgeraci/.bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/mgeraci/.rvm/bin:/Users/mgeraci/local/bin

# nvm (must be after path declaration, as nvm adds itself to the path)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# okcupid settings
alias dj="ssh mgeraci.dev.okcupid.com"
alias okf="cd ~/Web/okfrontend"

# okc frontend aliases
if [ -f ~/frontend_aliases/.frontend_aliases ]; then
	source ~/frontend_aliases/.frontend_aliases
fi

# okc aliases
if [ -f ~/.okcupid_aliases ]; then
	source ~/.okcupid_aliases
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
