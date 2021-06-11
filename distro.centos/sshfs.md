# SSHFS on CentOS
As easy as:
```
# Enabling powertools repo
yum-config-manager --enable PowerTools
# Install sshfs utils package
yum install fuse-sshfs

# Or a oneshot command
dnf --enablerepo=powertools -y install fuse-sshfs
```
And there you go.
