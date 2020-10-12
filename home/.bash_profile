# See following for more information: http://www.infinitered.com/blog/?p=19

# Path ------------------------------------------------------------
export PATH=/usr/local/share/npm/bin:/usr/local/mysql/bin:$PATH  # OS-X Specific, with MacPorts and MySQL installed
export NODE_PATH=/usr/local/lib/node:$NODE_PATH

# add your bin folder to the path, if you have it.  It's a good place to add all your scripts
if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH
fi

# Load in .bashrc -------------------------------------------------
source ~/.bashrc

# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X,
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile
#     .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started
# (when you run "bash" from inside a shell, or when you start a shell in
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed,
# in this order:
#     bashrc
#     .bashrc
