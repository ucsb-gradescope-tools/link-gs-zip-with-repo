#!/bin/sh

mkdir -p deploy_keys
ssh-keygen -b 2048 -t rsa -f ./deploy_keys/deploy_key -q -N ""
echo "*** Here is the public key that you should add as a deploy key"
echo "***  for your repo:"
cat ./deploy_keys/deploy_key.pub
