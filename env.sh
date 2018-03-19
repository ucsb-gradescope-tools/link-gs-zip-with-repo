#!/bin/sh

BASE_DIR=/autograder/git-repo
GIT_REPO=git@github.ucsb.edu:CS32-S15/cs32-s15-lab00-gradescope.git

# Extra just the git repo: https://serverfault.com/questions/417241/extract-repository-name-from-github-url-in-bash

WITHOUT_SUFFIX="${GIT_REPO%.*}"
REPO_NAME="$(basename "${WITHOUT_SUFFIX}")"
REPO_HOST="$(basename "${WITHOUT_SUFFIX%/${REPO_NAME}}")"

echo \$BASE_DIR=$BASE_DIR
echo \$GIT_REPO=$GIT_REPO
#echo \$WITHOUT_SUFFIX=$WITHOUT_SUFFIX
echo \$REPO_NAME=$REPO_NAME
#echo \$REPO_HOST=$REPO_HOST
