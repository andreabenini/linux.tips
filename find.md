
```sh
# Just like "ls -la" but do not list ".." and "."
find . -maxdepth 1 -not -name '.'

# Assorted options (depth, type file, match|don't match)
find /path/to/uploads -maxdepth 1 -type f -not -name 't_*'
```
