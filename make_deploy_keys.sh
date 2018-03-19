#!/bin/sh

mkdir -p deploy_keys
ssh-keygen -b 2048 -t rsa -f ./deploy_keys/deploy_key -q -N ""
