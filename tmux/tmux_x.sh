#!/bin/bash

SESSION=main
tmux="tmux -2 -f /home/karim/settings/tmux/tmux.conf"
windows_count=`tmux list-windows | wc -l`
nourpos_path="/home/karim/nourpos"

# create a new session, named $SESSION, and detach from it
$tmux new-window    -t $SESSION:$(($windows_count + 1))

$tmux send-keys "cd $nourpos_path/packages/updater && npm start" C-m

$tmux split-window  -h -p 84 -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd $nourpos_path/packages/deviceManager && npm start" C-m

$tmux split-window  -h -p 80 -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd $nourpos_path/packages/auth && sleep 5 && npm start" C-m

$tmux split-window  -v -p 80 -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd $nourpos_path/packages/keyManager && npm start" C-m

$tmux split-window  -v -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd $nourpos_path/packages/apiGateway && npm start" C-m

$tmux split-window  -h -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd $nourpos_path/packages/restApi && sleep 5 && npm start" C-m
