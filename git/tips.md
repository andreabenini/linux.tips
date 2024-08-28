## Current git repository information
```sh
git config --list
```

## git clone/pull/... from non a non standard port
```sh
# in this case machine name is 'remotehost' and remote ssh port is '55466
git clone ssh://git@remotehost:55466/ben/project.git
```

## Remote repositories list
```sh
git remote show origin
```


## Unstage/remove files from current commit
To unstage files from current commit
```sh
git reset HEAD -- path/to/file
# or (recursive on dirs)
git reset HEAD -- .
```


## Reset/Discard local branch changes
Destructive, use it with care
```sh
# Always safer to check current status before doing nasty things
git status
# Brute force mode if you really want to
git reset --hard
# Or something like this to restore to a well known point
git reset --hard <COMMIT_ID>
# HEAD points to your current branch (current commit)
git reset --hard HEAD
```


## Edit latest commit message
```sh
# Amend/edit latest committed message
git commit --amend
```


## Create new branch
```sh
git checkout -b newbranch
```


## Rename current branch
```sh
git branch -m newname
```


## git pull _(with a dry-run)_
```sh
# Estimate what merge might change, fetch changes but don't merge
git fetch origin branch
# Diff current HEAD with fetched commits
git diff HEAD..origin/branch

#...do whatever you need here...

# Merge fetched commits
git merge origin/branch

# Abort/reset fetched commits
# ...taking a look at reflog and reset back to desired state
git reflog
#> ...
#> ben666  HEAD@{0}: merge activity
#> ab000ba HEAD@{1}: fetch origin/branch
#> 0dead00 HEAD@{2}: activity before the fetch
#> ...
git reset --hard HEAD@{2}
```

## See Push changes before submitting them
For a list of files to be pushed:
```sh
# see list of pushed files before doing it
git diff --stat --cached origin/master

# Code diff of the files to be pushed:
git diff [remote repo/branch]

# Full file paths of the files that will change
git diff --numstat [remote repo/branch]
```


## Branch list
```sh
### all branches
git branch -a
### local branches
git branch
### remote branches
git branch -r
```


## Restore file from remote repo
```sh
# Restore file from previous commit, omit it if you want to restore from previous one
git checkout <commitID> -- file/to/restore file/to/restore
git checkout -- file/to/restore file/to/restore

# Reset file to original content (from brach), some kind of reset --hard on a single file
git checkout HEAD -- file/to/restore
```


## Disable pager|less on git commands
Temporarily disable default pager from git
```sh
# for example when printing available branches
git --no-pager branch
```
To permanently disable pager from git you need to add this config to your `~/.gitconfig` file
```ini
[core]
    pager = cat
```


## List of branches (local and remote)
```sh
git --no-pager branch -a
```


## Fetch all remote branches and sync all
Use also `-p, --prune`, after fetching, remove any remote-tracking branches which no longer exist on the remote
```sh
git fetch --prune
```

## Diff between two branches
They can be local or remote as well
```sh
# Might be master or whatever thing you've at your disposal
git diff branch1..branch2
```

## Delete branch
```sh
# Delete local branch
git branch -D <local-branch-name>
# Delete remote branch
git push origin --delete <remote-branch-name>
```


## Detailed list of remote machines
```sh
git remote -v
```


## List of files in branch 'master'
```sh
git ls-tree -r master
```


## Cleanup .gitignore problems
When you add information to _.gitignore_ file you may face out some troubles and sometimes it seems it's not properly working.  
That might be related to common local cache problems. Something like this might be helpful:
```sh
# Cleanup cache information
# It might be a good idea to delete SINGLE FILES individually, like:
git rm -rf --cached config.yaml
# Instead of removing all of them at once
git rm -rf --cached .

# Get back in business with some adds later on
git add .
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


## View previous git commits
```sh
# Easy, just few changes here
git log
git show <LOGNAME>
# Harder, way more changes reported, combination of (git-log + less). Color edition
git log --pretty=oneline v254.15..v254.17 --color=always |less -R
```


## Show user latest commits
To grab some information from github just substitute with favorite username, when an user is not that smart you
probably will see it's email address poorly configured on git
```sh
https://api.github.com/users/<username>/events/public
```


## Show differences between commits
```sh
# Show differences between two commits
git show
#...also works
git diff HEAD^ HEAD
```


## Show differences between current code and latest commit
```sh
# Show differences between current uncommitted code and latest commit
git diff origin/master
```

## Stash commands
Stash stores temporarily the changes to work on something else and re-apply changes later.
```sh
# Stash all uncommitted changes
git stash
# Stash all uncommitted and untracked files
git stash -u -a
# Save a stash with a message MESSAGE_ID
git stash save MESSAGE_ID

# Retrieve back stashed changes
git stash pop

# Stash history
git stash list

# Show stash made in STASH_ID
git stash show -p STASH_ID

# Remove latest stash entry
git stash drop
# Remove stash STASH_ID entry
git stash drop STASH_ID

# Remove all stashed entries
git stash clear
```

## Remove from repo all previously deleted files
List of all deleted files from the repo and apply `git rm` to them
```sh
git ls-files --deleted -z | xargs -0 git rm
```

## Ignore SSL issuer certificates
***http.sslVerify***  
Whether to verify the SSL certificate when fetching or pushing over HTTPS. 
Can be overridden by the `GIT_SSL_NO_VERIFY` environment variable.  
***http.sslCAInfo***  
File containing the certificates to verify the peer with when fetching or pushing
over HTTPS. Can be overridden by the `GIT_SSL_CAINFO` environment variable.  
***http.sslCAPath***  
Path containing files with the CA certificates to verify the peer with when fetching or pushing over HTTPS.
Can be overridden by the `GIT_SSL_CAPATH` environment variable.  
***http.sslCert***  
File containing the SSL certificate when fetching or pushing over HTTPS.
Can be overridden by the `GIT_SSL_CERT` environment variable.  
***http.sslKey***  
File containing the SSL private key when fetching or pushing over HTTPS.
Can be overridden by the `GIT_SSL_KEY` environment variable.  
***http.sslCertPasswordProtected***  
Enable git's password prompt for the SSL certificate. Otherwise OpenSSL will prompt the user,
possibly many times, if the certificate or private key is encrypted.
Can be overridden by the `GIT_SSL_CERT_PASSWORD_PROTECTED` environment variable.  

```sh
# oneliner for a single command
git -c http.sslVerify=false clone|pull|....
# Or directly edit .git/config file and add:
#> [http]
#>    sslVerify = false

# same goes for this one as well
GIT_SSL_NO_VERIFY=true git clone https://example.com/path/to/git

# Do NOT do this unless you're aware of what you're doing
git config [--global] http.sslVerify false
```

## Permanently remove a file from the repository and wipe its information from history too
```sh
# Go to repository home
cd [repository home]

# Must pull, commit and push changes before proceeding with the operation
# stash files are allowed pending changes are not
git pull
git add .
git commit -m "Updating changes"
git push

# Now save and keep a copy of your special file somewhere (outside the repo is better)

# git filter-branch command is that will be used
#   [--tree-filter] option
#       Allows to rewrite the history of the repository by applying a specified command to each commit
git filter-branch --tree-filter 'rm -f path/of/the/file/todelete.txt' -- --all
# Forcing push to [origin] in order to rewrite history there too
git push origin --force --all

# just to try a sync after the previous operation
git pull
```

## Set system editor
Set your sistem editor to _vim_ or whatever you prefer
```sh
# do it globally not just related to project itself
# remove --global to set it to your current project only
git config --global core.editor "vim"
```
