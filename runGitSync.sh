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

# This is baked into /home/explorer436/Downloads/GitRepositories/my-personal-things/programming/Set up computer/02SetupCustomRepositories.sh. So, we don't have to do it manually.

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

# Path to git-sync executable
GIT_SYNC="$HOME/Downloads/GitRepositories/git-sync/git-sync"

# The list of repositories
REPOS=(
    "career-notes"
    "finance-notes"
    "health-notes"
    "mindset-notes"
    "my-kitchen-sink"
    "my-personal-things"
    "programming-notes"
    "programming-playground"
    "site-builder"
    "soft-skills"
)

# Loop through the list and do git-sync on all of them. Pull the latest changes down.
for repo in "${REPOS[@]}"; do
    REPO_DIR="$HOME/Downloads/GitRepositories/$repo"

    # 1. Sync the main repository
    echo "Syncing: $repo"
    if cd "$REPO_DIR"; then
	"$GIT_SYNC"
    else
	echo "Directory $REPO_DIR not found. Skipping..."
	continue
    fi

    # 2. Sync the Mainroad theme directory if it exists
    THEME_DIR="$REPO_DIR/themes/Mainroad"
    if [ -d "$THEME_DIR" ]; then
	echo "Syncing Mainroad theme for: $repo"
	cd "$THEME_DIR" && "$GIT_SYNC"
    fi

    cd
done

# Build all the static sites
bash ./buildHugoSites.sh

# Post-build check for uncommitted changes
echo "Checking repositories for uncommitted changes post-build..."
for repo in "${REPOS[@]}"; do
    REPO_DIR="$HOME/Downloads/GitRepositories/$repo"

    # Check main repository
    if cd "$REPO_DIR" 2>/dev/null; then
	if [ -n "$(git status --porcelain)" ]; then
	    echo "Uncommitted changes found in $repo after build. Running git-sync..."
	    "$GIT_SYNC"
	fi

	# Check theme directory if it exists
	THEME_DIR="$REPO_DIR/themes/Mainroad"
	if [ -d "$THEME_DIR" ] && cd "$THEME_DIR" 2>/dev/null; then
	    if [ -n "$(git status --porcelain)" ]; then
		echo "Uncommitted changes found in Mainroad theme ($repo) after build. Running git-sync..."
		"$GIT_SYNC"
	    fi
	fi
    fi

    cd
done
