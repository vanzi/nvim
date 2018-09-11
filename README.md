# Overview

Neovim configuration meant mostly for Python.

# Requirements

* [neovim](https://github.com/neovim/neovim)
* [python-client](https://github.com/neovim/python-client) for neovim
* [flake8](http://flake8.pycqa.org/en/latest/)
* [flake8-docstrings](https://pypi.org/project/flake8-docstrings/)
* [gitlint](https://jorisroovers.github.io/gitlint/)

# Installation
### Config

1. Compile Python with shared libraries support. In `pyenv` this requires:
```sh
export PYTHON_CONFIGURE_OPTS="--enable-shared"
```
2. Install [vim-plug](https://github.com/junegunn/vim-plug):
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
3. Clone the repository:
```sh
git clone https://github.com/vanzi/nvim ~/.config/nvim
```
4. Start neovim and run:
```sh
:PlugInstall
```
5. Exit neovim and install [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) dependencies:
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
