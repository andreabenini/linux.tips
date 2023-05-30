### Grep AND pattern
Searches inside a filesystem a file with term1 AND term2 strings inside it (in this order)
```sh
find . |grep -i -e 'term1.*term2'
```

## Multiple grep in the same command
```sh
# Exclude from ls command: file1,file2
ls -la | grep -v -e file1 -e file2
```


### Seek 'n' Destroy
Massive search and replace a string inside a bunch of files, it might take some time...
```sh
grep -rIl 'Some Text Here' /path/where/files/are/* | xargs sed -i 's/Some Text Here/Ben is cool/g'
```
