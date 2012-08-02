#!/bin/bash


#############################################################################
## Local Command Demo
#############################################################################
# Introduce yourself to git
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

# Set up the testing repo
mkdir git_test
cd git_test
git init

# Add some content
echo "Hello Git World" >> README
git add README

# Show some our changes
git status

# Commit our changes
git commit -m "Adding README"

# Look at the commit log
git log

# Make some more changes
echo "Line 2" >> README
git add README
git commit -m "Adding Line 2"
echo "Line 3" >> README
git add README
git commit -m "Adding Line 3"
echo "Clear file" > README
git add README
git commit -m "Clear file"

# Opps the last commit erased things, let's fix that
# Find the offending commit via git log
git log

# See that we deleted all the lines
git diff HEAD~

# First let's use a reset
git reset HEAD~
echo "Hello Git World" > README
echo "Line 2" >> README
echo "Line 3" >> README
echo "Clear file" >> README
git add README
git commit -m "Don't clear line this time"

# Another way to fix with checkout
git checkout HEAD~~ -- README
git add README
git commit -m "Going back to line 2"

# go back to topdir for local command demo
cd ..

#############################################################################
## Remote command demo
#############################################################################

# Lets setup a bare repository to act as the "server"
git clone --local --bar git_test git_bare

# Tell our repo to use the "server" repo
cd git_test
git remote add origin ${PWD}/../git_bare
git config branch.master.remote origin
git config branch.master.merge refs/heads/master
cd ..

# Clone a new repo from the "server instance"
git clone --local git_bare git_test_2

# Let's add some changes from the new clone
cd git_test_2
echo "test_2_line">> README
git commit -a -m "Test 2 commit"

# Need to tell the "server" about these changes
git push
cd ..

# Now initial repo can get changes from server
cd git_test
git pull 

