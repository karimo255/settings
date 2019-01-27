#!/bin/bash

echo "copy pomodoro binary to /usr/local/bin/"
cd && cd settings
cp tmux/bin/pomodoro /usr/local/bin/

apt-get install cmus

echo "Install vim-gtk to copy from/to system clipboard"
apt-get install vim-gtk

echo "Install ag (silversearcher)"
apt-get install silversearcher-ag

echo "Run Compile script for yourCompleteMe"
cd vim/bundle/youcompleteme
python 3 ./install.py --all
cd && cd settings
