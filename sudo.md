# sudo tips

```sh
# Execute command with redirection from another user
# [but with sudo privileges]
sudo sh -c 'ls -hal /root/ > /root/test.out'
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
