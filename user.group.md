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
