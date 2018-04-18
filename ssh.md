```
## Put your ~/.ssh/id_rsa.pub (LOCAL) in /root/.ssh/authorized_keys (REMOTE HOST)
ssh root@remotehost # To enter there without a password
```


Create public key from private
```
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
```
