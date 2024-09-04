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
## Search packages installed from a specific repository
```sh
zypper search --installed-only --repo <repositoryName>
```

## Remove a repository
```sh
# Easy
zypper repo delete <repositoryName>
# Manual
sudo rm /etc/zypp/repos.d/<repositoryFileName>
```
