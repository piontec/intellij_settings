#!/bin/bash

setup_vim() {
  if [ ! -d $HOME/.vim ]
  then
    git clone https://github.com/tdi/vimrc.git ~/.vim/
    rm -f $HOME/.vimrc 
    ln -s $HOME/.vim/vimrc $HOME/.vimrc
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  fi
}

setup_vim
