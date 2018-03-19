# gradescope-simple-template-draft

Draft of a simple template for a Gradescope Autograded assignment that pulls its info from a github repo.

# Instructions

1. Clone this repo
2. Change the contents of repo.txt to be the URL of the repo you want to clone into your autograded assignment.
3. Run `./make_autograder_zip`
4. Use the generated `Autograder.zip` file as the thing you upload to Gradescope.
5. Profit

# UNSOLVED PROBLEMS (But easy to fix)

If this were a real autograded assignment, the repo would need to be a private one.   That means you need to figure out how the repo can use a public key/private key pair to clone and pull from your private repo.

That should be straightforward.

# REFERENCES you need to fix this:

1. Read this about github deploy keys:  <https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys>

2. Read this about setting that up on Gradescope: <https://gradescope-autograders.readthedocs.io/en/latest/git_pull/>

