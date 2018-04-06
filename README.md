# gradescope-simple-template-draft

Collection of scripts that helps you
* generate an autograder.zip file for gradescope, 
* that is connected to a private github repo, so that
* so that, you don't have to upload the autograder.zip file more than once.

That is: if you are making minor changes to your assignment, you do NOT need to update the autograder.zip file on Gradescope.  You only update your private repo.

It works, because the scripts are set up to do a "git pull" from your private repo before each student's submission is graded.

The only times you would need to regenerate the autograder.zip are when:

1. If you change the packages you are installing in the `apt-get.sh` script.
2. If you have so many changes to so many files that the `git pull` is slowing down the grading.  In that case, 
   regenerating the autograder.zip file is not strictly necessary, but may improve performance.

But, for simple changes, such as changing a test case, fixing a bug in the starter code, etc., you can simply change the code in the private repo for the assignment, push the change to github, and then the autograder just starts using your new version immediately.   Nice!

# Instructions

1. Prepare a repo that has the following in it:
   * `apt-get.sh` with everything you need to install for your assignment
       * IF YOU MAKE CHANGES to the `apt-get.sh` you must redo the `./make-autograder_zip` step
       
   * `requirements.txt` (ONLY if it is a Python assignment and you have pip installs that
       you need.)
   * `grade.sh` with the command/commands that should run to produce the results.json file.

      - What that `grade.sh` looks like will differ depending on which programming language you are using, and whether
         you are doing diff-based testing or unit testing.
      - See other documentation for each specific programming language and testing mode for specifics.
       

2. Clone this repo

3. Change the contents of `env.sh` so that the environment variable `GIT_REPO` points to the ssh url for your autograded assignment (the repo that has `grade.sh`, `apt-get.sh` and `requirements.txt` in it, plus your assignments starter code and test cases.)

   ```bash
   #!/bin/sh
   GIT_REPO=git@github.com:ucsb-cs8-s18/PRIVATE-cs8-s18-lab00.git
   ```


4. Run ./make_deploy_keys.sh to generate a public/private key pair.  You can
   run this anywhere (e.g. on any system that has `ssh-keygen` and a Unix shell).
   
   * *private key:* `deploy_keys/deploy_key`
   * *public key:* `deploy_keys/deploy_key.pub`

   Note
   that these two files are in the `.gitignore` and should generally
   NOT be uploaded to a git repo.  The private key becomes part of the `Autograder.zip`
   file, while the public key gets attached to the github repo as it's "deploy key":
   
5. Upload the public key (`deploy_keys/deploy_key.pub`) as the deploy key for your assignment specific github repo, following [these instructions](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys)

6. Run `./make_autograder_zip`

7. Use the generated `Autograder.zip` file as the thing you upload to Gradescope.

8. For small changes, only update the github repo.

9. For big changes, redo the `./make_autograder_zip` script, and reupload the `Autograder.zip` file.


# REFERENCES 

1. Read this to learn about github deploy keys:  <https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys>

2. Read this to learn more about Gradescopes recommended process: <https://gradescope-autograders.readthedocs.io/en/latest/git_pull/>

# Security considerations

As far as I can tell, the `deploy_key` file in the [setup.sh file in the Gradescope Example](https://github.com/gradescope/autograder_samples/blob/master/deploy_keys/setup.sh) is actually the private key (e.g. `gs-repo-key`, or `cs32-s15-lab00-repo-key`) in the above example.

The public key needs to be put in the repo here, following [these github.com instructions for deploy keys](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys)

With those two steps in place, the example begins to make more sense.

Note that while you *could* reuse the same `deploy_key`/`deploy_key.pub` pair over and over, that most definitely defeats the purpose.    The idea is that the `deploy_key` provides access to one, and only one repo, so that if it leaks, the security of at most one repo is breached.

It would be a very bad idea, for example, to use the same deploy_key for all of the assignments in a particular course--then the leaking of that key compromises not just one assignment, but all of the assignments for that course.   Although it may be annoying, it is worth the hassle to generate a new one for each assignment.

Further, it is probably a good idea to have the deploy_key in the .gitignore file for any repo that you make so that it never gets stored in git.

You might keep it in the directory where you cloned the repo, and if you lose it, generate a new one (uploading it to a new copy of the `Autograder.zip` and updating the public key for the github repo.)





