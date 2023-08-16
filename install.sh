#!/bin/sh
working_dir=$(pwd)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "$working_dir"/vimrc ~/.vimrc
mkdir -p ~/.config/nvim/
ln -s "$working_dir"/vimrc ~/.config/nvim/init.vim
ln -s "$working_dir"/lua ~/.config/nvim/lua
