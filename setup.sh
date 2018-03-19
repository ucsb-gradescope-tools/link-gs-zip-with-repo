#!/usr/bin/env bash

. env.sh

# Extract just the git repo: https://serverfault.com/questions/417241/extract-repository-name-from-github-url-in-bash

BASE_DIR=/autograder/git-repo
WITHOUT_SUFFIX="${GIT_REPO%.*}"
REPO_NAME="$(basename "${WITHOUT_SUFFIX}")"
REPO_HOST="$(basename "${WITHOUT_SUFFIX%/${REPO_NAME}}")"

echo \$BASE_DIR=$BASE_DIR
echo \$GIT_REPO=$GIT_REPO
#echo \$WITHOUT_SUFFIX=$WITHOUT_SUFFIX
echo \$REPO_NAME=$REPO_NAME
#echo \$REPO_HOST=$REPO_HOST

mkdir -p /root/.ssh
cp ssh_config /root/.ssh/config

# Make sure to include your private key here

cp deploy_key /root/.ssh/deploy_key

# To prevent host key verification errors at runtime

ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Clone autograder files

mkdir -p /autograder/source/${REPO_NAME}
git clone ${GIT_REPO} git@github.com:gradescope/autograder_samples /autograder/source/${REPO_NAME}

# If there is a requirements.txt file in the repo, Install python dependencies

if [ -f /autograder/source/${REPO_NAME}/apt-get.sh ]; then
    echo "Installing Linux requirements from ${GIT_REPO}/apt-get.sh"
    /autograder/source/${REPO_NAME}/apt-get.sh
fi

if [ -f /autograder/source/${REPO_NAME}/requirements.txt ]; then
    echo "Installing Python requirements from ${GIT_REPO}/requirements.txt"
    pip install -r /autograder/source/${REPO_NAME}/requirements.txt
fi


