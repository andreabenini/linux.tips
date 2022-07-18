## Current git repository information
git config --list


## Unstage/remove files from current commit
To unstage files from current commit
```sh
git reset HEAD -- path/to/file
# or (recursive on dirs)
git reset HEAD -- .
```


## Create new branch
```sh
git checkout -b newbranch
```


## Rename current branch
```sh
git branch -m newname
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
Restore file from previous commit, omit it if you want to restore from previous one
```sh
git checkout <commitID> -- file/to/restore file/to/restore
git checkout -- file/to/restore file/to/restore
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


## Fetch all remote branches and sync all
Use also `-p, --prune`, after fetching, remove any remote-tracking branches which no longer exist on the remote
```sh
git fetch --prune
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
# It might be a good idea to delete SINGLE FILES individually instead of removing all of them at once
git rm -rf --cached .

# Get back in business with some adds
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


## Set system editor
Set your sistem editor to _vim_ or whatever you prefer
```sh
# do it globally not just related to project itself
# remove --global to set it to your current project only
git config --global core.editor "vim"
```
