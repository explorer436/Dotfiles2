#!/bin/bash

cd ~/Downloads/GitRepositories/mindset-notes
echo "${PWD##*/}"
if [ -z "$(git status --porcelain)" ]; then
  echo "Working directory clean"
else
  echo "Uncommitted changes"
  ./convertOrgToMd.py
  hugo
  pagefind --site "public"
fi

cd ~/Downloads/GitRepositories/programming-notes
echo "${PWD##*/}"
if [ -z "$(git status --porcelain)" ]; then
  echo "Working directory clean"
else
  echo "Uncommitted changes"
  ./convertOrgToMd.py
  hugo
  pagefind --site "public"
fi

cd ~/Downloads/GitRepositories/health-notes
echo "${PWD##*/}"
if [ -z "$(git status --porcelain)" ]; then
  echo "Working directory clean"
else
  echo "Uncommitted changes"
  ./convertOrgToMd.py
  hugo
  pagefind --site "public"
fi

cd ~/Downloads/GitRepositories/career-notes
echo "${PWD##*/}"
if [ -z "$(git status --porcelain)" ]; then
  echo "Working directory clean"
else
  echo "Uncommitted changes"
  ./convertOrgToMd.py
  hugo
  pagefind --site "public"
fi

cd ~/Downloads/GitRepositories/finance-notes
echo "${PWD##*/}"
if [ -z "$(git status --porcelain)" ]; then
  echo "Working directory clean"
else
  echo "Uncommitted changes"
  ./convertOrgToMd.py
  hugo
  pagefind --site "public"
fi

cd ~/Downloads/GitRepositories/my-kitchen-sink
echo "${PWD##*/}"
if [ -z "$(git status --porcelain)" ]; then
  echo "Working directory clean"
else
  echo "Uncommitted changes"
  ./convertOrgToMd.py
  hugo
  pagefind --site "public"
fi
