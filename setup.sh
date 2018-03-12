#!/usr/bin/env bash

# Clone autograder files

mkdir -p /autograder/github-repo
cd /autograder
git clone `cat repo.txt` github-repo



