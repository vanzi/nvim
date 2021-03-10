# Overview

Minimal neovim configuration for Python 3 with sane defaults, asynchronous
linters (flake8 with plugins), automatic fixers (isort, autopep8) and autocomplete.

# Requirements

* [neovim](https://github.com/neovim/neovim)
* System dependencies (for Ubuntu 18.04+):
```sh
apt install python-dev python3-dev build-essential cmake silversearcher-ag
```

# Installation
### Config

1. Compile Python with shared libraries support. In `pyenv` this requires:
```sh
export PYTHON_CONFIGURE_OPTS="--enable-shared"
pyenv install 3.8.8
```
2. Install required `pip` packages:
```sh
pip install pynvim flake8 flake8-docstrings gitlint isort autopep8
```
3. Install [vim-plug](https://github.com/junegunn/vim-plug):
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
4. Clone the repository:
```sh
git clone git@github.com:vanzi/nvim.git ~/.config/nvim
```
5. Start neovim and run:
```sh
:PlugInstall
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
4. Start tmux session and verify `Tc` option is enabled:
```sh
tmux info | grep Tc
```

# Quick Start


| Keys            | Command                              |
| --------------- | ------------------------------------ |
| `F2`            | toggle line numbering                |
| `F3`            | toggle paste mode                    |
| `F5`            | remove trailing whitespace in file   |
| `<C-p>`         | fuzzy file finder                    |
| `<Leader>cc`    | comment code                         |
| `<Leader>cu`    | uncomment code                       |
| `<Leader>d`     | go to definition                     |
| `<Leader>r`     | find occurences                      |
| `<Leader>.`     | next buffer                          |
| `<Leader>,`     | previous buffer                      |
| `<Leader>jf`    | format json file                     |
| `:Gblame`       | inline git blame                     |
