#!/bin/bash

# If you see errors like this:line 12: $'\r': command not found 
# run this to fix it: `dos2unix ./PullFromGitRepositories.sh`

# Prerequisites: tmux
# How to run:
# From terminal, run this script:sh ~/Downloads/GitRepositories/programming-playground/kafka/real-world-example/SetUp.sh
# tmux ls (to list all the tmux sessions)
# tmux attach -t pullFromGitRepos (to attach to the session ListOfAppsToBeStarted)
# Ctrl-b w to select the window to jump to.

session="pull-from-github"
tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'dot-files-repository'
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=1
tmux new-window -t $session:$window -n 'programming-playground'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/programming-playground' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=2
tmux new-window -t $session:$window -n 'my-personal-things'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/my-personal-things' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=3
tmux new-window -t $session:$window -n 'programming-notes'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/programming-notes' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=4
tmux new-window -t $session:$window -n 'finance-notes'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/finance-notes' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=5
tmux new-window -t $session:$window -n 'mindset-notes'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/mindset-notes' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=6
tmux new-window -t $session:$window -n 'health-notes'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/health-notes' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=7
tmux new-window -t $session:$window -n 'career-notes'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/career-notes' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m

window=8
tmux new-window -t $session:$window -n 'my-articles-collection'
tmux send-keys -t $session:$window 'cd ~/Downloads/GitRepositories/my-articles-collection' C-m
tmux send-keys -t $session:$window 'git remote update' C-m
tmux send-keys -t $session:$window 'git pull' C-m



# And use this url in a browser: http://localhost:8080/topics to view the kafka topics

# And use this url in a browser: http://localhost:5601/app/dev_tools#/console to view OpenSearch UI dashboard

# Clean-up
# You can use "tmux kill-server" to cleanly and gracefully kill all tmux open sessions (and server).
# "docker stop $(docker ps -a -q)" to stop all the containers.
# "docker system prune -a" to clean up docker containers and images.

tmux attach -t pull-from-github
