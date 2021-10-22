# Homesick

This repository contains Dotfiles for my home directory, including bashrc and
zshrc files, my zsh theme, some helper scripts, and all of my vim settings.

I use [homeshick](https://github.com/andsens/homeshick) to sync these across
systems. After cloning the repo on a new machine, install the submodules, and
run `homeshick link homesick`.

## Vim's Coc plugin
A few notes on installing Coc for vim:
- on the first open of vim after installing the coc submodule, you may see an
  error about a "missing index.js" file.
- in command mode in vim, run `exec coc#util#install()`
- close and open vim, and then you should see a message about "creating data
  directory". this means that coc was installed properly and is ready to use.
