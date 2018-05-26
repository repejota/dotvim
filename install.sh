#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/chriskempson/base16-vim.git ~/.vim/bundle/base-16.vim
vim +PluginInstall +qall
