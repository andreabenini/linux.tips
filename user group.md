# Add user
```sh
# Simple
useradd ben
# Set a specific UserID, valid for system accounts as well
useradd -u 666 ben
# Create user and his home dir [-m|--create-home] (contents from /etc/skel)
useradd -m ben
# Same as above but with a different path (default: /home)
useradd -m -d /opt/newhomedir ben
# Create a specific group for it (usergroup in this case)
useradd -g usergroup ben
# Add secondary groups to user
sudo useradd -g usergroup -G wheel,dev,staff ben
# Set a specific shell for user
useradd -s /usr/bin/zsh ben
# Add comment to user (cit.Patrick "TheMan")
useradd -c "Master of Puppets" ben
# Add system user named "share" (id<1000) [-r|--system]
useradd -r share
```

# Add user to a group
```sh
# Add user <ben> to group <mynewgroup>
usermod -a -G mynewgroup ben
```
To finally use this newly created group you can:
- logout and enter in the new session
- use `newgrp mynewgroup` to enter into it without logging out

# Change user primary group
to change user's default group you basically need to use `-g` flag, so:
```sh
usermod -g mynewgroup ben
```
