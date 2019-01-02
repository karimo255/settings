#!/bin/bash
SESSION=main
tmux="tmux -2 -f /home/karim/settings/tmux/tmux.conf"

# if the session is already running, just attach to it.
$tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
       echo "Session $SESSION already exists. Attaching."
       sleep 1
       $tmux attach -t $SESSION
       exit 0;
fi
                                 
# create a new session, named $SESSION, and detach from it
$tmux new-session -d -s $SESSION
$tmux new-window    -t $SESSION:1 
$tmux split-window  -h -t $SESSION:1
$tmux split-window  -v -t $SESSION:1
$tmux split-window  -h -t $SESSION:1
$tmux split-window  -v -t $SESSION:1
$tmux new-window    -t $SESSION:2
$tmux split-window  -h -t $SESSION:2
$tmux split-window  -v -t $SESSION:2
$tmux split-window  -v -t $SESSION:2
$tmux attach -t $SESSION
echo "hey!!!!"
