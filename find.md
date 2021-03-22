
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

# List files (or dirs) between two dates
find . -type f -newermt '01 aug 2020 00:00:00' -not -newermt '01 sep 2020 00:00:00' -ls
# Delete files (or dirs) between two dates
find . -type f -newermt '01 aug 2020 00:00:00' -not -newermt '01 sep 2020 00:00:00' -delete

# Change directory permissions recursively with find and chmod
find . -type d -exec chmod 755 {} \;
# Change files permissions recursively with find and chmod
find . -type f -exec chmod 644 {} \;

# Rename all files and dirs to lowercase, but keep the shell out of reach of children/win users/pets, ...
#  -depth  Lists each directory’s contents before the directory itself
#  -n 1    Instructs xargs to use at most one argument per command line from find output
find /somedir -depth | xargs -n 1 rename -v 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;

```
