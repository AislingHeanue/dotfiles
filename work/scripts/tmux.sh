#!/usr/bin/zsh

# Open the session based on the directory specified. Must be a sub-directory of ~/dev
NAME=$1

# Check if the session exists, otherwise create it
tmux has-session -t $NAME &> /dev/null

if [ $? != 0 ]
then
	tmux new-session -s $NAME -n nvim -d -c "/home/aisling/dev/$NAME"
    tmux new-window -t $NAME:1 -n git -c "/home/aisling/dev/$NAME" lazygit
    tmux new-window -t $NAME:2 -n $NAME -c "/home/aisling/dev/$NAME" 
    tmux new-window -t $NAME:3 -n ~ -c "/home/aisling" 
fi

tmux attach -t $NAME


