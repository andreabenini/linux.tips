
# Revert to a specific version
```
git log -p
# Get required commit ID from log and use its output with --soft
git reset --soft 4ef2e27167cd51a299999999983c3d44a897b8d2
```

The `--soft` parameter tells Git to reset HEAD to another commit, but that’s it.
If you specify `--soft` Git will stop there and nothing else will change.
What this means is that the index and working copy don’t get touched, so all of the
files that changed between the original HEAD and the commit you reset to appear to be staged.

The `--hard` parameter will blow out everything, it resets HEAD back to another commit,
resets the index to match it, and resets the working copy to match it as well.
This is the more dangerous of the commands and is where you can cause damage.

The `--mixed` parameter (which is the default if you don’t specify anything) will reset
HEAD to another commit, and will reset the index to match it, but will stop there.
The working copy will not be touched. So, all of the changes between the original HEAD
and the commit you reset to are still in the working copy and appear as modified, but not staged.
