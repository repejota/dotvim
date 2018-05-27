#!/bin/sh
if [ ! -d ~/.vim/bundle/base-16.vim ]; then
    git clone https://github.com/chriskempson/base16-vim.git ~/.vim/bundle/base-16.vim
fi
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
