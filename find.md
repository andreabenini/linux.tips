
```sh
# Just like "ls -la" but do not list ".." and "."
find . -maxdepth 1 -not -name '.'

# Count the number of files recursively
find . -type f | wc -l

# Count the number of directories recursively
find . -type d | wc -l

# Echo death links from dir (with some fancy {} substitution for nicely formatted output)
find -L . -name . -o -type d -prune -o -type l -exec echo $(file={}; echo "--> ${file}") \;

# Assorted options (depth, type file, match|don't match)
find /path/to/uploads -maxdepth 1 -type f -not -name 't_*'

# find all files modified in the last 24 hours
find / -mtime -1 -ls 

```
