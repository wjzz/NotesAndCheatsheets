# @author : Wojciech Jedynak (wjedynak@gmail.com)
# @date   : 2011-11-28
# @tags   : hg ; mercurial ; note ; cheatsheet
# @short  : A list of useful notes for hg/mercurial

# mercurial cheatsheet
# based on http://hgbook.red-bean.com/

# version check
hg version

# path to the repo root
hg root

# help
hg help
hg help -v
hg help init

# init
hg init repo-name

# add
hg add
hg add file
hg add -n                               # dry run
hg add src                              # add files starting with src

# clone
hg clone repo-url
hg clone src-repo dest-repo

# status
hg status
hg st                                   # useful shortcut
hg st -a                                # show all files
hg st -i                                # show ignored files

# log
hg log

hg log -r 0                             # show selected rev's only
hg log -r 2:5                           # show rev's in range
hg log -f Makefile                      # follow a given file
hg log -k keyword                       # filter using a keyword (case insensitive)
hg log -p                               # show patch

hg tip                                  # show the last commit 
 
# diff
hg diff
hg kdiff                                # user defined (credits to wieczyk)
hg diff -r 4:6                          # diff between rev's

# incoming
hg incoming hello2                      # see changes before pulling from hello2

# pull
hg pull ../hello2
hg pull -u                              # pull AND update

# outgoing
hg outgoing hello2                      # see changes before pushing to 

# update
hg update                               # update to tip
hg update tip                           # same thing
hg update rev-number                    # update to given revision

# parents
hg parents                              # show the revision the working dir is at

# heads
hg heads

# merge
hg merge

# resolve
hg resolve
hg resolve -l

# fetch
hg fetch                                # extension

# rename
hg rename
hg mv

# remove
hg remove file
hg remove --after file                  # use after the file is deleted manually

# revert
hg revert file

# adderemove
hg addremove

hg commit -A -m "Commit immediately after addremove"

# tags
hg tags
hg tag v0.1

# rollback
hg rollback

# backout
hg backout

# bisect
hg bisect

# config
hg showconfig
hg showconfig hooks

# branching
hg branches                             # list all named branches
hg branch                               # display current branch
hg branch name                          # create a new brach (or switch to it, if it already exists)
