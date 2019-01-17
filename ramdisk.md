# Example
```sh
mkdir /mnt/ramdisk
mount -t tmpfs -o size=512m tmpfs /mnt/ramdisk
vi /etc/fstab
# tmpfs    /mnt/ramdisk    tmpfs    nodev,nosuid,noexec,nodiratime,size=1024M    0 0
```

# Docs
- [Create a RAM disk in Linux](https://www.jamescoyle.net/how-to/943-create-a-ram-disk-in-linux)
- [The Difference Between a tmpfs and ramfs RAM Disk](https://www.jamescoyle.net/knowledge/951-the-difference-between-a-tmpfs-and-ramfs-ram-disk)
