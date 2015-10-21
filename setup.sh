#!/bin/bash

HOME_CFG=home
echo "Install prerequisites"

install_prereq() {
  if [ ! -f /usr/bin/zsh ]
  then
    sudo apt-get install -y zsh
  fi

  if [ ! -f /usr/bin/git ]
  then
    sudo apt-get install -y git
  fi 
}

setup_ohmyzsh() {
  if [ ! -d $HOME/.oh-my-zsh ]
  then
    git clone http://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  fi         
}

install_prereq

DOTFILES=`pwd`
DATE=`date "+%Y%m%d-%H%M"`
DOTFILES_BACKUP="${DOTFILES}/backup_${DATE}"

echo "Saving backup in $DOTFILES_BACKUP"
if [ ! -d $DOTFILES_BACKUP ]; then
  mkdir $DOTFILES_BACKUP
fi

for file in `ls $HOME_CFG`; do
  echo "Backup file: $file"
  mv -f $HOME/.$file $DOTFILES_BACKUP/ 
  echo "Symlink file: $file"
  ln -s "$DOTFILES/$HOME_CFG/$file" "$HOME/.$file"
done 

setup_ohmyzsh
