# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mgeraci"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

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

# ask first
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

export media_box='vnc://mgeraci.bounceme.net'

# stop trying to correct some spellings
alias consular="nocorrect consular"
alias irssi="nocorrect irssi"
alias meteor="nocorrect meteor"

# -----------------------
# RVM Support
# -----------------------
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

# Customize to your needs...
export PATH=/usr/local/git/bin:/usr/local/ruby/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin::/Users/mgeraci/.bin:/usr/local/share/npm/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/mgeraci/.rvm/bin:/Users/mgeraci/local/bin
export NODE_PATH="$HOME/local/lib/node_modules/"
