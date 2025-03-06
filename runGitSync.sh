#!/bin/bash


# Prerequisite:
# 1. Clone git-sync repo into ~/Downloads/GitRepositories (from https://github.com/simonthum/git-sync)
# 2. Run these two commands in all of the repositories.

# Or, navigate to the git/config file for that repository and add these two lines at the end: ~/Downloads/GitRepositories/my-personal-things/.git/config

# [branch "main"]
#	remote = origin
#	merge = refs/heads/main
#	sync = true
#	syncNewFiles = true

# git config --bool branch.main.sync true
# git config --bool branch.main.syncNewFiles true

sh ./buildHugoSites.sh

cd ~/Downloads/GitRepositories/my-personal-things
~/Downloads/GitRepositories/git-sync/git-sync

cd ~/Downloads/GitRepositories/programming-notes
~/Downloads/GitRepositories/git-sync/git-sync

cd ~/Downloads/GitRepositories/programming-playground
~/Downloads/GitRepositories/git-sync/git-sync

cd ~/Downloads/GitRepositories/career-notes
~/Downloads/GitRepositories/git-sync/git-sync

cd ~/Downloads/GitRepositories/finance-notes
~/Downloads/GitRepositories/git-sync/git-sync

cd ~/Downloads/GitRepositories/health-notes
~/Downloads/GitRepositories/git-sync/git-sync

cd ~/Downloads/GitRepositories/mindset-notes
~/Downloads/GitRepositories/git-sync/git-sync

cd ~/Downloads/GitRepositories/my-articles-collection
~/Downloads/GitRepositories/git-sync/git-sync
