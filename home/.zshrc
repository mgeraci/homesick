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
alias bd="git diff --name-status main... | sort"

# newer, brewed version of vim
alias vi="vim"

# update git submodules
alias update_submodules="git submodule foreach git pull origin master"

# stop trying to correct some spellings
alias consular="nocorrect consular"
alias irssi="nocorrect irssi"
alias meteor="nocorrect meteor"
alias glue="nocorrect glue"

# rvm support
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

# path
export PATH="/opt/homebrew/bin:/usr/local/git/bin:/usr/local/ruby/bin:/usr/local/bin"
PATH="$PATH:/usr/local/sbin:$HOME/.bin:$HOME/bin:/usr/local/share/npm/bin"
PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"
PATH="$PATH:/Users/mgeraci/Library/Python/2.7/bin"
PATH="$PATH:$HOME/.rvm/bin:$HOME/local/bin"
export PATH="$HOME/.yarn/bin:$PATH"

# nvm (must be after path declaration, as nvm adds itself to the path)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# okcupid settings
alias dj="ssh mgeraci.dev.ue1.aws.okcupid.com"
alias okf="cd ~/Web/okfrontend"
alias okb="cd ~/Web/okbackoffice"

# okc frontend aliases
if [ -f ~/frontend_aliases/.frontend_aliases ]; then
	source ~/frontend_aliases/.frontend_aliases
fi

# but overwrite a few okc frontend alias
alias okc="cd /Volumes/$USER/okgit/cupid/okcontent"
alias oka="cd /Volumes/$USER/okapi/"
alias f="ack"

# yarn script completion
if [ -f ~/.bin/yarn-completion.bash ]; then
    . ~/.bin/yarn-completion.bash
fi

# okc aliases
if [ -f ~/.okcupid_aliases ]; then
	source ~/.okcupid_aliases
fi

# load a computer-specific file, if present
if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
