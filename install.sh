#!/bin/bash

echo "copy pomodoro binary to /usr/local/bin/"
cp tmux/bin/pomodoro /usr/local/bin/

apt-get install cmus

echo "Install vim-gtk to copy from/to system clipboard"
apt-get install vim-gtk
