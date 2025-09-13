# How to forward X11 application in a ssh tunnel
To use X11 applications inside ssh tunnels all you need is open connections with something like:
`ssh -X user@remoteserver` and a brand new shell is created on `remoteserver`.

## ERROR: X11 forwarding request failed on channel 0
`X11 forwarding request failed on channel 0`

This is a common error when your X11 connection is not properly configured, default security policies on every major
distributions have X11 disabled by default (because it's the right thing to do), but when you're in a private/safe lan
is not wrong to disable this sanity check.

Here are needed steps to avoid it:
- Edit `/etc/ssh/sshd_config` file
- Set these options in it
```conf
    X11Forwarding       yes
```
- Save and close the file
- Restart sshd daemon (with init script or systemctl utility)
- Install `xorg-xauth` in your local machine to connect and support x11 authentication through the tunnel, the package
  has no dependencies and it's quite thin but it has to be installed (locally and on remote server)
- Check if `xauth` is present on `remoteserver`, if it not present you need to install it with your favorite package
  manager. Usually called `xorg-xauth|x11-auth|xauth`. Most common name is `xorg-xauth`.
- Open a new shell from `localhost` to `remoteserver` with a command like this one:
```
ssh -X user@remoteserver
```
- First time you log into `remoteserver` you may see an output message like
```
/usr/bin/xauth:  file /home/YourUserName/.Xauthority does not exist
```
  It's quite normal, xauth is informing you about your brand new xauth security file, just ignore it or reboot to see if
  it goes away. On latest xorg installations a reboot is suggested.

Now in this new shell you can run everything you want from command line and applications will be rendered locally on your
XOrg server

### Note: Suggested login
If you receive errors trying to run graphical applications, try ForwardX11Trusted instead
```sh
ssh -Y user@remoteserver
```

### Troubleshooting
As usual comes handy to always see what it does during the login phase. that's the reason why issuing commands like:
```sh
ssh -vvY user@oldMachine
```
comes handy when you still have login issues or the X11 channel is not properly forwarded

### Known host automation for future connections
Instead of using each single time something like:
```sh
ssh -Y user@otherMachine
```
Really comes handy to store this profile with some default options. It's usually possible through the `~/.ssh/config` file.  
This might be a default X11 forwarder for a specific host
```conf
Host other-machine
    HostName <IP.Address.Other.Machine>
    User <username>
    ForwardX11 yes
```
