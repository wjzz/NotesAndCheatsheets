# @author : Wojciech Jedynak (wjedynak@gmail.com)
# @date   : 2011-08-27
# @tags   : git; note; cheatsheet
# @short  : My list of most useful git commands with short notes

## OVERALL

# check the global configuration
git config --list

# check a given parameter
git config user.name

# init a repo
git init

# add files
git add .

# check status
git status

# commit (opens the editor of choise to enter the message)
git commit

# commit with a given message
git commit -m "message"

# commit all files
git commit -am "message"

# change the last commit without creating a new one (i.e. fix the message)
git commit --amend

# ignore changes since last commit
git checkout -f

# create new branch
git checkout -b newBranchName

# check branches
git branch

# switch to brach
git checkout branch

# merge branches
git merge branch-to-merge-into-currect-branch

# move a file
git mv old new

# delete a file
git rm file

# clone a project (last parameter is optional - it's the dir to put the data)
git clone git://github.com/schacon/grit.git mygrit

# compare with the last version (not stagered!)
git diff

# compare with the last version
git diff --cached

# check the commit history
git log

# the same but with stats
git log --stat

# the same but with diffs after each commit
git log -p
git log -p -2 # limit to last 2 commits

# loging with user defined formating:
git log --pretty=format:"%an (%ae) | %ad | %s"

## GIT HUB
git remote add origin git@github.com:<username>/first_app.git
git push origin master
git push

## HEROKU
heroku create
heroku open
heroku rake db:migrate
heroku db:push
heroku db:pull
heroku console
git push heroku
