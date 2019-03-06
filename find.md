
```sh
# Just like "ls -la" but do not list ".." and "."
find . -maxdepth 1 -not -name '.'

# Count the number of files recursively
find . -type f | wc -l

# Count the number of directories recursively
find . -type d | wc -l

# Assorted options (depth, type file, match|don't match)
find /path/to/uploads -maxdepth 1 -type f -not -name 't_*'
```
