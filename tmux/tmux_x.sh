#!/bin/bash
SESSION=main
tmux="tmux -2 -f /home/karim/settings/tmux/tmux.conf"
windows_count=`tmux list-windows | wc -l`
# create a new session, named $SESSION, and detach from it
$tmux new-window    -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd /home/karim/nourpos/packages/wss && npm start" C-m

$tmux split-window  -h -p 84 -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd /home/karim/nourpos/packages/updater && npm start" C-m

$tmux split-window  -h -p 80 -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd /home/karim/nourpos/packages/auth && npm start" C-m

$tmux split-window  -v -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd /home/karim/nourpos/packages/api-gateway && npm start" C-m

$tmux split-window  -h -t $SESSION:$(($windows_count + 1))
$tmux send-keys "cd /home/karim/nourpos/packages/rest-api && npm start" C-m
