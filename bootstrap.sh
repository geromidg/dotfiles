#!/bin/sh

home_files='aliases gitconfig inputrc vimrc zshrc'

for file in $home_files; do
  ln -svf $PWD/$file ~/.$file
done

