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
    AllowTcpForwarding  yes
    X11Forwarding       yes
    X11DisplayOffset    10
    X11UseLocalhost     yes
```
- Save and close the file
- Restart sshd daemon (with init script or systemctl utility)
- Check if `xauth` is present on `remoteserver`, if it not present you need to install it with your favorite
package manager
- Open a new shell from `localhost` to `remoteserver` with a command like this one:
```
ssh -X user@remoteserver
```
- First time you log into `remoteserver` you may see an output message like
```
/usr/bin/xauth:  file /home/YourUserName/.Xauthority does not exist
```
  It's quite normal, xauth is informing you about your brand new xauth security file, just ignore it

Now in this new shell you can run everything you want from command line and applications will be rendered locally on your
XOrg server

### Note:
If you receive errors trying to run graphical applications, try ForwardX11Trusted instead
```sh
ssh -Y user@remoteserver
```
