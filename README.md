# Overview

Neovim configuration meant mostly for Python.

# Requirements

* [neovim](https://github.com/neovim/neovim) 
* [python-client](https://github.com/neovim/python-client) for neovim
* [pylama](https://github.com/klen/pylama) (or other linters as needed)

# Installation
### Config
First clone the repository:

```sh
git clone https://github.com/vanzi/nvim ~/.config/nvim
```

Then start neovim to install all plugins.

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
