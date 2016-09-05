#!/bin/bash

#VIM plug install
mkdir -vp ~/.vim/autoload
cp vim/plug.vim ~/.vim/autoload
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

export VIMINIT='source $MYVIMRC'
export MYVIMRC=~/portableEnvironment/vim/.vimrc


