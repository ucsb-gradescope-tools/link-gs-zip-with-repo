#!/usr/bin/env bash

# Extract just the git repo:
#   https://serverfault.com/questions/417241/extract-repository-name-from-github-url-in-bash

BASE_DIR=/autograder/git-repo
WITHOUT_SUFFIX="${GIT_REPO%.*}"
REPO_NAME="$(basename "${WITHOUT_SUFFIX}")"

echo \$BASE_DIR=$BASE_DIR
echo \$GIT_REPO=$GIT_REPO
echo \$REPO_NAME=$REPO_NAME
