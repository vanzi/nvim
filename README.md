# Overview

Minimal neovim configuration for Python with sane defaults, asynchronous
linters and autocomplete. And inline blame, obviously.

# Requirements

* [neovim](https://github.com/neovim/neovim)

# Installation
### Config

1. Compile Python with shared libraries support. In `pyenv` this requires:
```sh
export PYTHON_CONFIGURE_OPTS="--enable-shared"
```
2. Install required `pip` packages:
```sh
pip install neovim flake8 flake8-docstrings gitlint
```
3. Install [vim-plug](https://github.com/junegunn/vim-plug):
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
4. Clone the repository:
```sh
git clone https://github.com/vanzi/nvim ~/.config/nvim
```
5. Start neovim and run:
```sh
:PlugInstall
```
6. Exit neovim and compile dependencies for [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):
```sh
sudo apt-get install python-dev python3-dev build-essential cmake

cd ~/.local/share/nvim/plugged/YouCompleteMe/
./install.py
```

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
