#!/bin/bash

# Inside runGitSync.sh
# When a computer wakes up, the Wi-Fi often takes 2–5 seconds to reconnect.
# This script could fail if it runs too fast, because there is no internet.
# Adding a small "wait for internet" loop at the very top of your runGitSync.sh file:
until ip route show default | grep -q default; do
  echo "Waiting for network interface..."
  sleep 2
done
echo "Network interface is up."
# Now run your git commands...

# Prerequisite:
# 1. Clone git-sync repo into ~/Downloads/GitRepositories (from https://github.com/simonthum/git-sync)
# 2. Run these two commands in all of the repositories.

# Or, navigate to the git/config file for that repository and add these two lines at the end: ~/Downloads/GitRepositories/my-personal-things/.git/config

# git config --bool branch.main.sync true
# git config --bool branch.main.syncNewFiles true

# [branch "main"]
#	remote = origin
#	merge = refs/heads/main
#	sync = true
#	syncNewFiles = true

sh ./buildHugoSites.sh

# The list of repositories
REPOS=(
    "my-personal-things"
    "programming-notes"
    "programming-playground"
    "career-notes"
    "finance-notes"
    "health-notes"
    "mindset-notes"
    "my-kitchen-sink"
    "soft-skills"
)

# Loop through the list and sync
for repo in "${REPOS[@]}"; do
    echo "Syncing: $repo"
    cd ~/Downloads/GitRepositories/"$repo" || continue
    ~/Downloads/GitRepositories/git-sync/git-sync
    cd
done
