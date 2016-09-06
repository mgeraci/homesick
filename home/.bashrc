# See following for more information: http://www.infinitered.com/blog/?p=19


# Colors ----------------------------------------------------------
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups

# ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # Lists all the colors


# Misc -------------------------------------------------------------
export HISTCONTROL=ignoredups
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none"
bind "set show-all-if-ambiguous On"

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# append branch name when you're in a git directory
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}


# Prompts ----------------------------------------------------------
export PS1="\[${COLOR_GREEN}\]\w\$(parse_git_branch) > \[${COLOR_NC}\]"  # Primary prompt with only a path

# This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
# weird wrapping errors occur on some systems, so this method is superior
# Turn this off of you are running directly in the console on the machine
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'  # user@host path

export PS2='> '    # Secondary prompt
export PS3='#? '   # Prompt 3
export PS4='+'     # Prompt 4


# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'

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
	command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs;
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility


# Git completion ---------------------------------------------------
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

__git_complete g __git_main


# Other aliases ----------------------------------------------------
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Misc
alias g='git'
alias f='find . -iname'
alias ducks='du -cks * | sort -rn | head -11' # Lists folders and files sizes in the current folder
alias m='more'
alias df='df -h'

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -nr | head -20"

alias specc='spec -c -f n'

# Path -------------------------------------------------------------
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$HOME/local/node/bin:$PATH"
export PATH="/usr/local/git/bin:/usr/local/ruby/bin:$PATH"

complete -C ~/bin/tablete -o default rake
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=$PATH:$HOME/local/bin
export NODE_PATH="$HOME/local/lib/node_modules/"

# load nvm, if present
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# update git submodules
alias update_submodules="git submodule foreach git pull origin master"

# okcupid aliases
if [ -f ~/frontend_aliases/.frontend_aliases ]; then
	source ~/frontend_aliases/.frontend_aliases
fi

# okcupid devjail-specific settings
if [ -f ~/.devjail_settings ]; then
	source ~/.devjail_settings
fi

# okcupid ssh settings
if [ -f /home/u1/bin/ssh-magic ]; then
	source /home/u1/bin/ssh-magic
fi
