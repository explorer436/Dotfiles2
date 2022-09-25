#!/bin/bash

# Prerequisites: tmux
# How to run:
# From terminal, run this script:sh ~/Downloads/GitRepositories/programming-playground/kafka/real-world-example/SetUp.sh
# tmux ls (to list all the tmux sessions)
# tmux attach -t pullFromGitRepos (to attach to the session ListOfAppsToBeStarted)
# Ctrl-b w to select the window to jump to.

session="pullFromGitRepos"
tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'pullConfigRepo'
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=1
tmux new-window -t $session:$window -n 'pullProgrammingRepo'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/programming-playground' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=2
tmux new-window -t $session:$window -n 'pullPersonalRepo'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/my-personal-things' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=3
tmux new-window -t $session:$window -n 'pullThoughtsRepo'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/thoughts-notes' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

# And use this url in a browser: http://localhost:8080/topics to view the kafka topics

# And use this url in a browser: http://localhost:5601/app/dev_tools#/console to view OpenSearch UI dashboard

# Clean-up
# You can use "tmux kill-server" to cleanly and gracefully kill all tmux open sessions (and server).
# "docker stop $(docker ps -a -q)" to stop all the containers.
# "docker system prune -a" to clean up docker containers and images.
