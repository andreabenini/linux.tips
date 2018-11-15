# MachineID (WTF ???)
A cloned virtual machine with systemd might run fine in the same network of the original one but it might be better
if you change its MachineID.

## WTF ? what is the Machine ID?
Pretty useless (https://www.freedesktop.org/software/systemd/man/machine-id.html) but even if you don't like it and you're
using systemd you still need to deal with it. It's now strictly related to systemd but if you are dealing with its garbage
you're probably having it in your machine as well (see: https://unix.stackexchange.com/questions/402999/it-is-ok-to-change-etc-machine-id).

## Change it
Now what ? Easy steps to change it
```sh
rm /etc/machine-id
systemd-machine-id-setup
# Check it, now you've the new one
hostnamectl status
```
