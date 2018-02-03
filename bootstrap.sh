#!/bin/sh

home_files='aliases gitconfig inputrc tmux.conf tmuxline.snapshot vimrc zshrc'

rm -rf ~/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

for file in $home_files; do
  ln -svf $PWD/$file ~/.$file
done

mkdir ~/.config/zathura
ln -svf $PWD/zathurarc ~/.config/zathura/zathurarc

mkdir ~/.vim/syntax
ln -svf $PWD/syntax/* ~/.vim/syntax

vim +PluginInstall +qall
~/.vim/bundle/youcompleteme/install.py --clang-completer

