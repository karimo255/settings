#!/bin/bash

echo "copy pomodoro binary to /usr/local/bin/"

cp tmux/bin/pomodoro /usr/local/bin/
apt-get update && apt-get install ifstat
