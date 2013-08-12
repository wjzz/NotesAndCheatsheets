# jobs monitoring
top
htop

# file compression and decompression
cat file | gzip --best (or -9) >out.gz
cat file | zip >out.zip
zcat out.gz >in
zcat out.zip >in2
unzip -p out.zip

