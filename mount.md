# mount/remount
Remount an already mounted device with R/W properties
```sh
mount /dev/mmcblk0p1 -o remount,rw
```

# Finding mount point
```sh
# Find a mount point
findmnt /dev/sda1

# Operation on a specific mount point
# for example create a testfile in the root of the mount point
sudo touch $(findmnt -n -o TARGET /dev/sda1)/testfile
```
