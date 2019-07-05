# SSH with Certificates

### Create public and private keys
```sh
# plain as is
ssh-keygen -t rsa
# specify email address to use
ssh-keygen -t rsa -C "your.email@domain.com"
```

### Create public key from private
```sh
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
# Works for putty .ppk public keys too
```

### Putty Stuff
You can convert a .ppk file with putty-tools.
```
# Convert .ppk file with puttygen to OpenSSH's format
puttygen <the_key.ppk> -O private-openssh -o <new_openssh_key>.key
```

### Remote shell with certificate (no password login)
```sh
## copy ~/.ssh/id_rsa.pub (LOCAL) in /root/.ssh/authorized_keys (REMOTE HOST)
## this method allows you to enter in your remotehost without a password
##     ssh root@remotehost # To enter there without a password
```


# SSHFS in a script without password
`-o password_stdin` allows you to automate sshfs in a script easily
```
echo myPassword | sshfs user@remote.host.ssh:/ ~/mnt/example -o workaround=rename -o password_stdin
```
