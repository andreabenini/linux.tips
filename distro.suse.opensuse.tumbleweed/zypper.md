# Search package that provides a specific utility
To find out which package provides a particular executable in an SUSE Linux installation, you can use the zypper command with the search option and the `--provides` flag
```sh
# This command will search the package repository and list the package that provides the tree executable.
zypper search --provides tree
# or the short version
zypper se --provides tree
```
