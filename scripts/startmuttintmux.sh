#!/bin/bash
muttsyncall
tmux new-window -n "oIMAP Gmail" -d "offlineimap -a Gmail"
tmux new-window -n "oIMAP Netcourrier" -d "offlineimap -a Netcourrier"
neomutt
tmux send-keys -t "oIMAP Gmail" C-c
tmux send-keys -t "oIMAP Netcourrier" C-c
tmux detach
