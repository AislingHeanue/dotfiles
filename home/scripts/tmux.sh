#!/usr/bin/zsh

# Open the session based on the directory specified. Must be a sub-directory of ~/dev
NAME=$1

# Check if the session exists, otherwise create it
tmux has-session -t $NAME &> /dev/null

if [ $? != 0 ]
then
    tmux new-session -s $NAME -n nvim -d -c "/mnt/d/Documents/Coding/github/$NAME"
    tmux new-window -t $NAME:2 -n $NAME -c "/mnt/d/Documents/Coding/github/$NAME"
    tmux new-window -t $NAME:3 -n ~ -c "/home/aisling"
    tmux send-keys -t $NAME:1 "vi ." Enter
fi

tmux attach -t $NAME:1
