#!/bin/bash

#!/bin/bash

# 1. Define your repositories
REPOS=(
  "$HOME/Downloads/GitRepositories/mindset-notes"
  "$HOME/Downloads/GitRepositories/programming-notes"
  "$HOME/Downloads/GitRepositories/health-notes"
  "$HOME/Downloads/GitRepositories/career-notes"
  "$HOME/Downloads/GitRepositories/finance-notes"
  "$HOME/Downloads/GitRepositories/my-kitchen-sink"

)

# 2. Loop through each repository
for REPO in "${REPOS[@]}"; do
  # Move into the directory or skip if it doesn't exist
  if ! cd "$REPO"; then
    echo "Directory $REPO not found. Skipping..."
    continue
  fi

  REPO_NAME="${PWD##*/}"
  echo "--- Checking: $REPO_NAME ---"

  # 3. Check for uncommitted changes
  if [ -z "$(git status --porcelain)" ]; then
    echo "Working directory clean."
  else
    echo "Uncommitted changes detected. Starting Hugo process..."

    # --- INLINED startAndStopHugoServer logic ---

    echo "Running 'make all' in: $(pwd)"
    make make_detatched

    echo "Waiting for $REPO_NAME to go live..."
    # Loop until localhost:1414 returns a 200 OK or similar
    until curl -s http://localhost:1414 > /dev/null; do
      sleep 1
    done

    echo "Site is up. Running tasks for $REPO_NAME..."

    # Add any specific tasks you want to run while the server is up here

    echo "Stopping server..."
    make stop

    # --- END INLINED logic ---
  fi

  echo "" # Spacer for the next repo
done

echo "All repositories processed."
