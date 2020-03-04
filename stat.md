## Get stat of a file
```sh
$ ls -la filename
-rw-r--r-- 1 root root 0 Aug 27 21:24 filename

$ stat filename
  File: ‘filename’
  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
Device: 801h/2049d	Inode: 45358219    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2018-08-12 12:24:37.000000000 +0200
Modify: 2018-08-12 12:24:37.000000000 +0200
Change: 2018-08-27 21:27:34.715695430 +0200
 Birth: -
```

## Get date from file
```sh
date -R -r filename
Mon, 27 Aug 2018 21:24:37 +0200
```

## Alter stat of a file
```sh
$ touch -d "Sun, 12 Aug 2018 12:24:37 +0200" filename
```

## Alter stat (ctime) of a file
well, you can't. But... temporary editing with system clock might do what you'd like
```sh
# One shot execution in order to avoid mess
# Or alter $NOW to whatever you'd like
NOW="2020-01-01 10:20:30" && sudo date -s "2010-02-03 11:12:13" && touch CONTRIBUTING.md && sudo date -s "$NOW"
```

## User/Group of a file
```sh
# Get user:group (name) of a file
stat file.conf --format "%U %G"

# Multiple assignment on single line of USER:GROUP of a file
read -r USER GROUP <<<$(stat file.conf --format "%U %G"); echo "$USER:$GROUP"
```
