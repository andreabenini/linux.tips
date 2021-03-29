# Argument list too long
When you deal with a directory with a lot of files and you want to remove them you might see a message like this one
```sh
bash: /usr/bin/rm: Argument list too long
```
This problem can be solved in different ways:
- Remove the directory itself, not just single files, so:
```sh
# Do not use /path/to/directory/*
rm -r /path/to/directory
mkdir /path/to/directory
```
- Use `find` to delete them, `rm` creates a list and delete them after its creation, `find` execute a single command on each single file
```sh
find . -type f -delete
```
- Use `find` to match wildcards, when you just need to delete specific files this command might help:
```sh
find . -name '.txt' -type f -delete
```
