# sudo tips

```sh
# Execute command with redirection from another user
# [but with sudo privileges]
sudo sh -c 'ls -hal /root/ > /root/test.out'

# Same thing but without submitting the sudo password (taken from stdin)
echo "yourRootPassword" | sudo -S sh -c 'mount -t nfs remoteHost:/remote/nfs/share ~/mnt/'
```

# Alternative: runuser
Execute a command as another user, very useful for quick tests before chrooting services or system users
```sh
# Check ulimits for nginx user
runuser -l nginx -c 'ulimit -SHa'
# or just some dummy test (user must have a shell)
runuser -l dummyuser -c 'ls -la'
# this is when user has no login shell
runuser -u dummyuser -- ls -la
```

# Alternative: machinectl _(systemd)_
On a system with systemd (this is the cleanest way to get a full, "proper" session for another user
```sh
# ".host" can be ignored (sometimes)
machinectl shell username@.host
```
This usually solves issues like:
```log
Failed to connect to user scope bus via local transport: $DBUS_SESSION_BUS_ADDRESS and $XDG_RUNTIME_DIR not defined
(consider using --machine=<user>@.host --user to connect to bus of other user)
```
