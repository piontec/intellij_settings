#!/bin/bash

DOTFILES=`pwd`

setup_vim() {
  if [ ! -d $HOME/.vim ]
  then
    if [ ! -x /usr/bin/vim.nox ]; then
      sudo apt-get install -y vim-nox 
    fi
    rm -f $HOME/.vimrc 
    ln -s $DOTFILES/vim/vimrc $HOME/.vimrc
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  fi
}

setup_vim
