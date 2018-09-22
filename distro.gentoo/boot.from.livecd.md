# Booting back from a LiveCD or other environment
Boot from the LiveCD (or a different environment) until the environment grants shell access.
Create the /mnt/gentoo mount point (if one does not exist) and mount the root file system on it:
```
# mkdir /mnt/gentoo
# mount /dev/sda3 /mnt/gentoo
```
Next, bindmount `/proc`, `/dev` and `/sys` on top the `/mnt/gentoo` mountpoint:
```
# mount --rbind /proc /mnt/gentoo/proc
# mount --rbind /dev /mnt/gentoo/dev
# mount --rbind /sys /mnt/gentoo/sys
```
Finally, chroot into the environment, mount the remaining partitions, and start recovering the system:
```
# chroot /mnt/gentoo /bin/sh
# source /etc/profile
# mount -a
```
Once finished with the recovery steps, umount all partitions, exit the chroot, umount the remaining partitions,
and reboot back into the system to see if the recovery has succeeded:
```
# umount -a
# exit
# umount -l /mnt/gentoo/{dev,proc,sys,}
# sync
# reboot
```
