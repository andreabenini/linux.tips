# SSH with Certificates

### Create public and private keys
```sh
# plain as it is
ssh-keygen -t rsa
# add size too
ssh-keygen -t rsa -b 4096
# specify email address to use
ssh-keygen -t rsa -b 4096 -C "your.email@domain.com"
```

### config file
Example configuration file, `.ssh/config` _(chmod 600)_
```conf
Host ring0
    HostName 192.168.1.10
    User lucifer
    Port 6666
    IdentityFile ~/.ssh/inferno.key

Host heaven
    HostName 192.168.10.20

Host *ell
    user dante

Host * !caronte
    user kerberos
    LogLevel INFO

Host *
    User root
    Compression yes
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

# ssh to remote and map port locally
At the beginning of an ssh connection it's possible to tunnel some remote ports locally, for example:
```
ssh user@remotehost -L 8080:remotehost:80
# Maps on localhost:8080 the port 80 on remotehost
```
but even:
```
ssh user@remotehost -L 8080:otherRemoteHost:80
# Maps on localhost:8080 the port 80 available on a different host [otherRemoteHost] 
# but that can be seen from [remotehost], each request to [otherRemoteHost] came from [remotehost]
```
and also:
```
ssh user@remotehost -L 192.168.0.141:8080:otherRemoteHost:80
# Same as above but if 192.168.0.141 is the network address of current localhost machine then each
# single machine on the same network of [localhost] might access port 80 of [otherRemoteHost]
```

## remote host configuration
On **remotehost** you need to allow TCP forwarding in order to use ports on remote LAN. There's nothing
to do if you want to map `<localPort>:<remoteHost>:<remotePort>` but if you'd like to have
`<localPort>:<remoteHost>:<otherHostRemotePort>` please ensure this option inside your `/etc/ssh/sshd_config`:
```
AllowTcpForwarding yes
```
and restart _sshd daemon_ after your mod (if any)

# SSH Connection Timeout
To handle the ssh connection head over to `/etc/ssh/sshd_config` file and take a look at those two parameters:  
- **ClientIntervalAlive** parameter specifies the time in seconds that the server will wait before sending a null packet to the client system to keep the connection alive.
- **ClientAliveCountMax** parameter defines the number of client alive messages which are sent without getting any messages from the client. 
If this limit is reached while the messages are being sent, the sshd daemon will drop the session, effectively terminating the ssh session.

The timeout value is given by the product of the above parameters i.e.  
**Timeout value = ClientIntervalAlive * ClientAliveCountMax**
