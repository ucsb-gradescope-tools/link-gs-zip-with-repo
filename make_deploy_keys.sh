#!/bin/sh

. env.sh

KEYS_URL=${GIT_REPO/git@github.com:/https://github.com/}
KEYS_URL=${KEYS_URL/.git//settings/keys}

echo GIT_REPO=${GIT_REPO}
echo KEYS_URL=${KEYS_URL}

/bin/rm -rf deploy_keys
mkdir -p deploy_keys
ssh-keygen -b 2048 -t rsa -f ./deploy_keys/deploy_key -q -N ""

echo "***                                                      ***"
echo "***                     INSTRUCTIONS                     ***"
echo "***                                                      ***"
echo "*** STEP 0: Make sure env.sh points to the correct repo. ***"
echo "***         (See value of GIT_REPO shown above)          ***"
echo "***                                                      ***"
echo "*** STEP 1: VISIT the web page:                          ***"
echo "${KEYS_URL}"
echo "***                                                      ***"
echo "*** STEP 2: ADD DEPLOY KEY using this key:               ***"
echo "***                                                      ***"
cat ./deploy_keys/deploy_key.pub
echo "***                                                      ***"
echo "*** STEP 3: RUN ./make_autograder_zip.sh                 ***"
echo "*** STEP 4: UPLOAD Autograder.zip to Gradescope          ***"
echo "***                                                      ***"
echo ""
read -p "Do you wish to run ./make_autograder_zip now (y)?" yn
case $yn in
    [Yy]* ) ./make_autograder_zip ; break;;
    [Nn]* ) break;;
    * ) ./make_autograder_zip ; break;;
esac

