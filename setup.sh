#!/usr/bin/env bash

. env.sh

cd /autograder/source

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


