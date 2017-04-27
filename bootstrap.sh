#!/bin/sh

files='aliases gitconfig inputrc tmux.conf tmuxline.snapshot vimrc zshrc'

for file in $files; do
  ln -svf $PWD/$file ~/.$file
done

rm -rf -- ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall