## Authentication problems
When you deal with SSL keys sometimes you may want to troubleshoot issues when authentication fails, this is a good example for
gathering information from a broken auth, mostly by enabling ultra verbose mode on SSH connections.
```sh
# Verbose information to see possible key exchange problems
git config core.sshCommand "ssh -vvv"
git pull
```

## master reference broken
```sh
ben@ben ~/git $ git push -u 'localbackup' master --verbose
Pushing to ssh://git@xxx.xxx.xxx.xxx/home/git
To ssh://xxx.xxx.xxx.xxx/home/git
 = [up to date]        master -> master
Branch 'master' set up to track remote branch 'master' from 'localbackup'.
updating local tracking ref 'refs/remotes/origin/master'
error: update_ref failed for ref 'refs/remotes/origin/master': cannot lock ref 'refs/remotes/origin/master': unable to resolve reference 'refs/remotes/origin/master': reference broken
Everything up-to-date
```
solved with:
```
rm .git/refs/remotes/origin/master 
git fetch
git branch --set-upstream-to=origin/master
```
- Reference: https://github.com/desktop/desktop/issues/6121#issuecomment-437145964
