## Disable pager|less on git commands
```
# for example when printing available branches
git --no-pager branch
```


## List of branches (local and remote)
```
git --no-pager branch -a
```

## Detailed list of remote machines
```
git remote -v
```

## List of files in branch 'master'
```
git ls-tree -r master
```

## Save credentials (user/password) on git project
Issue the first command and then use a `git pull`<br>
**please note:** The credentials are stored in a file on the disk, with the disk permissions of "just user readable/writable" but still in plaintext
```
git config --global credential.helper store
git pull
```
