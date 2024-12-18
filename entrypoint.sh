#!/usr/bin/env bash
set -e

# Build the full repository URL
FULL_URL="${TARGET_URL}/${TARGET_GROUP}/${TARGET_REPO}.git"

echo "Configuring git with authentication..."
git config --global http.postBuffer 524288000
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999
git config --global --add safe.directory /github/workspace

# Add 'target' remote with authentication
echo "Adding target remote..."
AUTHENTICATED_URL="https://${TARGET_USERNAME}:${TARGET_TOKEN}@${FULL_URL}"
git remote add target "${AUTHENTICATED_URL}"
git fetch --all --prune

# Synchronize specified branches
IFS=',' read -ra BRANCH_LIST <<< "$TARGET_BRANCHES"

for branch in "${BRANCH_LIST[@]}"; do
  branch="$(echo -e "${branch}" | tr -d '[:space:]')"  # Remove whitespaces
  if git show-ref --verify --quiet refs/remotes/origin/$branch; then
    echo "Synchronizing branch $branch..."
    git checkout -B $branch origin/$branch
    git push -f target $branch
  else
    echo "Branch $branch does not exist in origin. Skipping..."
  fi
done

# Synchronize tags
echo "Synchronizing tags..."
git fetch --tags
git push -f --tags target

echo "Synchronization completed successfully."