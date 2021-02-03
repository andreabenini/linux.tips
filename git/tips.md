## Unstage/remove files from current commit
To unstage files from current commit
```sh
git reset HEAD -- path/to/file
# or (recursive on dirs)
git reset HEAD -- .
```


## Disable pager|less on git commands
```sh
# for example when printing available branches
git --no-pager branch
```


## List of branches (local and remote)
```sh
git --no-pager branch -a
```

## Delete local branch
```sh
git branch -D <local-branch-name>
```

## Detailed list of remote machines
```sh
git remote -v
```

## List of files in branch 'master'
```sh
git ls-tree -r master
```

## Save credentials (user/password) on git project
Issue the first command and then use a `git pull`<br>
**please note:** The credentials are stored in a file on the disk, with the disk permissions of "just user readable/writable" but still in plaintext
```sh
git config --global credential.helper store
git pull
```
Save user/email credentials, when needed or when VisualStudioCode (and similar IDEs) complains about them
```sh
git config --global user.name "Ben"
git config --global user.email "ben@ben"
```

## See latest commits (after a git pull)
Shows names of the files that changed for the last two commits.
```sh
git log --name-status -2
```

## Show user latest commits
To grab some information from github just substitute with favorite username, when an user is not that smart you
probably will see it's email address poorly configured on git
```sh
https://api.github.com/users/<username>/events/public
```
