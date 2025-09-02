# Search package that provides a specific utility
To find out which package provides a particular executable in an SUSE Linux installation, you can use the zypper command with the search option and the `--provides` flag
```sh
# This command will search the package repository and list the package that provides the tree executable.
zypper search --provides /usr/bin/tree
# or the short version
zypper se --provides /usr/bin/tree
```

# Search RPM package and download it
```sh
rpm -qa |grep tmux
zypper info tmux
zypper download tmux
```

# Repository related commands
## Search related commands
```sh
# Search packages installed from a specific repository
zypper search --installed-only --repo <repositoryName>

# Search binary from a package, no matter if it's installed or not
zypper search --provides <binary-Name>
```

## Remove a repository
```sh
# Easy
zypper repo delete <repositoryName>
# Manual
sudo rm /etc/zypp/repos.d/<repositoryFileName>
```

## Refresh repository
If you're getting something like:
```txt
    Warning: Repository metadata expired: Check if 'autorefresh' is turned on (zypper lr), otherwise                                                                                                                                    
    manually refresh the repository (zypper ref). If this does not solve the issue, it could be that                                                                                                                                    
    you are using a broken mirror or the server has actually discontinued to support the repository. 
```
It's just a matter of running `zypper ref` in order to resync with current repos, after that you can safely
run `zypper dup` or whatever you need

## Enable and Disable repositories
- `zypper repos` to list all your available repositories as usual.  
- `zypper modifyrepo -d repo-backports-update` to disable (not delete) a repository. The repository number could be used
   but it's better to always use the Alias instead of it
- `zypper modifyrepo -e repo-backports-update` to enable it back again. Same suggestions reported one line above are
   still valid


