#!/bin/bash
echo 'Linking the vimrc...'
ln -s ~/.vim/.vimrc ~/.vimrc

echo 'Cloning Vundle vim plugin...'
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Installing plugins...'
vim +PluginInstall +qall

echo 'Run npm install to install extra packages...'
echo 'This will run with sudo so we can install jshint globally.'
sudo npm install --unsafe-perm
