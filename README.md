# Overview

Neovim configuration meant mostly for Python.

# Requirements

* [neovim](https://github.com/neovim/neovim) 
* [python-client](https://github.com/neovim/python-client) for neovim
* [pylama](https://github.com/klen/pylama) (or other linters as needed)

# Installation
### Config

1. Install [dein](https://github.com/Shougo/dein.vim):
```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```
2. Clone the repository:
```sh
git clone https://github.com/vanzi/nvim ~/.config/nvim
```
3. Start neovim to install all plugins automatically.

### True Color (24-bit)

1. Update tmux to at least version 2.3.
2. In `~/.bashrc` add:
```sh
export TERM=screen-256color
```
3. In `~/.tmux.conf` add:
```sh
set -g default-terminal "screen-256color"
set-option -ga terminal-overrides ",screen-256color:Tc"
```
4. Start tmux session and verify Tc is enabled:
```sh
tmux info | grep Tc
```
