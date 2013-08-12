# jobs monitoring
top
htop

# file compression and decompression
cat file | gzip --best (or -9) >out.gz
cat file | zip >out.zip
zcat out.gz >in
zcat out.zip >in2
unzip -p out.zip

# `grep`ing
grep -f patterns input  #select lines matching any of the given patterns
grep -v pattern input  # inverts the selection
grep -c pattern input # count the lines, suppress output
egrep # uses regular expressions in patterns

# hosts
cat /etc/hosts

# full system info
uname -a
cat /etc/issue   # system name
