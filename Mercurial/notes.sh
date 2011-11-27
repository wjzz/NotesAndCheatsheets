# mercurial cheatsheet
# based on http://hgbook.red-bean.com/

## Chapter 02

# version check
hg version

# help
hg help
hg help -v
hg help init

# init
hg init repo-name

# add
hg add
hg add file

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

## Chapter 03
