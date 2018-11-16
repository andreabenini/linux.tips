### Create public and private keys
```sh
ssh-keygen -t rsa
```

### Create public key from private
```sh
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
```

### Remote shell with certificate (no password login)
```sh
## copy ~/.ssh/id_rsa.pub (LOCAL) in /root/.ssh/authorized_keys (REMOTE HOST)
## this method allows you to enter in your remotehost without a password
##     ssh root@remotehost # To enter there without a password
```
