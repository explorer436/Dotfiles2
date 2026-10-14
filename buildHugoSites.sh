#!/bin/bash

REPOS=(
  "$HOME/Downloads/GitRepositories/career-notes"
  "$HOME/Downloads/GitRepositories/finance-notes"
  "$HOME/Downloads/GitRepositories/health-notes"
  "$HOME/Downloads/GitRepositories/mindset-notes"
  "$HOME/Downloads/GitRepositories/my-kitchen-sink"
  "$HOME/Downloads/GitRepositories/programming-notes"
  "$HOME/Downloads/GitRepositories/soft-skills"
)

for REPO in "${REPOS[@]}"; do
  if ! cd "$REPO"; then
    echo "Directory $REPO not found. Skipping..."
    continue
  fi

  REPO_NAME="${PWD##*/}"
  echo "--- Checking: $REPO_NAME ---"

  echo "Cleaning up any stale processes on port 1414..."
  # Kill anything currently holding port 1414
  fuser -k 1414/tcp 2>/dev/null || true
  sleep 1

  echo "Starting Hugo server in: $(pwd)"
  # Ensure your Makefile/Hugo command explicitly binds to port 1414
  make make_detatched

  echo "Waiting for $REPO_NAME to go live..."

  # Add a timeout counter (e.g., max 30 seconds) to prevent infinite hangs
  TIMEOUT=60
  COUNTER=0

  until curl -s http://localhost:1414 > /dev/null; do
    sleep 1
    COUNTER=$((COUNTER + 1))
    if [ $COUNTER -ge $TIMEOUT ]; then
      echo "Error: Server failed to start within $TIMEOUT seconds."
      make stop
      break
    fi
  done

  # if this doesn't start in 60 seconds, check this: `journalctl -k | grep -i apparmor`. In Ubuntu servers, apparmor kills processes for security.

  if [ $COUNTER -lt $TIMEOUT ]; then
    echo "Site is up. Running tasks for $REPO_NAME..."
    # Add your specific tasks here
  fi

  echo "Stopping server..."
  make stop

  # Extra safety: ensure port is free before next loop iteration
  fuser -k 1414/tcp 2>/dev/null || true

  echo "" # Spacer
done

echo "All repositories processed."
