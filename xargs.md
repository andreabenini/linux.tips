Example
```sh
# Copy files matching a specific pattern elsewhere
find . -name *PATTERN*| xargs -I %  sh -c 'cp % /home/ben/tmp/'
```
