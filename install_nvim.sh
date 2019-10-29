#!/bin/bash

# install vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# link config files
mkdir -p ~/.config/nvim
LOCALDIR=$(pwd)
TMUX="/.tmux.conf"
NVIM="/init.vim"
ln -s "$LOCALDIR$NVIM" ~/.config/nvim/init.vim
ln -s "$LOCALDIR$TMUX" ~/.tmux.conf

# install plugins
nvim +PlugInstall +qall
