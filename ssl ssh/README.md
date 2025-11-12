# SSH with Certificates

### Create public and private keys
```sh
# plain as it is
ssh-keygen -t rsa
# add size too
ssh-keygen -t rsa -b 4096
# specify email address to use
ssh-keygen -t rsa -b 4096 -C "your.email@domain.com"
# Write it to a specific file
ssh-keygen -t rsa -b 4096 -C "your.email@domain.com" -f .ssh/newfile.not.thedefault.id_rsa
```

### List ssh keys
```sh
# signatures
ssh-add -l
# public keys from files
ssh-add -L
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

# SSHFS specify ssh key
```sh
sshfs -o IdentityFile=$HOME/.ssh/my.specific.identity.file.pub root@remote.host.name.here localmount
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

# ssh timeout
ssh daemon (sshd), which runs server-side, closes the connection from the server-side if the client goes silent.  
To prevent connection loss, instruct the ssh client to send a sign-of-life signal to the server once in a while.

The configuration for this is in the file $HOME/.ssh/config, create the file if it does not exist (chmod 600 ~/.ssh/config).  
To send the signal every minute to the remote host, put the following in that configuration file:

Host yourhost
    HostName yourhost.com
    ServerAliveInterval 60

To enable sending a keep-alive signal for all hosts, place the following contents in the configuration file.
### One shot solution
to keep it for just one connection without creating the file you can issue something like:
```sh
ssh -o ServerAliveInterval=60 ben@yourhost.com
```

## SSH Connection Timeout
To handle the ssh connection head over to `/etc/ssh/sshd_config` file and take a look at those two parameters:  
- **ClientIntervalAlive** parameter specifies the time in seconds that the server will wait before sending a null packet to the client system to keep the connection alive.
- **ClientAliveCountMax** parameter defines the number of client alive messages which are sent without getting any messages from the client. 
If this limit is reached while the messages are being sent, the sshd daemon will drop the session, effectively terminating the ssh session.

The timeout value is given by the product of the above parameters i.e.  
**Timeout value = ClientIntervalAlive * ClientAliveCountMax**

# remote host configuration
On **remotehost** you need to allow TCP forwarding in order to use ports on remote LAN. There's nothing
to do if you want to map `<localPort>:<remoteHost>:<remotePort>` but if you'd like to have
`<localPort>:<remoteHost>:<otherHostRemotePort>` please ensure this option inside your `/etc/ssh/sshd_config`:
```
AllowTcpForwarding yes
```
and restart _sshd daemon_ after your mod (if any)


# Windows, cygwin, Xorg, Terminator and ssh with certificates
Here's the magic combo: cygwin, xorg-server, ssh with certs... what else could go wrong ?  
Trying to use certificates under SSH and cygwin it seems to work fine **without** xorg, when you're using a graphical terminal from within xorg (xterm, terminator, ...)
you may run into problems due to the fact you need ssh-keyring (gnome-keyring, ssh-agent) to run it.
- Configure .ssh directory, file permissions and everything else like your public/private keys
- Execute SSH agent from xorg by adding to your `$HOME/.bashrc` file this content:
```sh
eval $(ssh-agent)
```
- Restart cygwin xorg and you're set. Now you can use `ssh <username@yourHost>` without passwords


# Common Errors or Warnings
## Refused connections
> ssh refusing connection with message "no hostkey alg"

On the destination machine it's better to create new rsa and dsa keys to fix it:
```sh
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
```

## Quantum encryption warnings
    ** WARNING: connection is not using a post-quantum key exchange algorithm.
    ** This session may be vulnerable to "store now, decrypt later" attacks.
    ** The server may need to be upgraded. See https://openssh.com/pq.html
Check out for a key **KexAlgorithms** entry in your `/etc/sshd/sshd_config` or
in the `/etc/sshd/sshd_config.d` directory. It has to be replaced with something like:

    KexAlgorithms sntrup761x25519-sha512@openssh.com,curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512
Which obviously are post quantum encryption algorithms. You can achieve it by:
- Removing the offending line in the file with **KexAlgorithms** content that misses the above values
- If **KexAlgorithms** is totally missing in `sshd_config` it's safe to create a new file in
    `/etc/sshd/sshd_config` (like for example `30-post-quantum-fix.conf`) and add content there
- If you want to keep your default configuration that contains the offending line it's also possible
    to override it by creating a file that has to be loaded before it. If you have a file like:
    `/etc/sshd/sshd_config.d/40-suse-crypto-policies.conf` containing that (wrong) policy you can
    override by loading your policy first, like creating a `30-post-quantum-fix.conf` which is
    loaded before it. **sshd** will load your configuration first and keeps it even if a new config
    will come after it
    ```toml
    # /etc/ssh/sshd_config.d/30-post-quantum-fix.conf content
    KexAlgorithms sntrup761x25519-sha512@openssh.com,curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512
    ```
