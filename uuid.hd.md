
# Show devices block IDs UUID
```sh
blkid
# Or just a specific device when needed
blkid /dev/sda1
# or pick up the list from /dev filesystem
ls -la /dev/disk/by-uuid/
```

# Assign new UUID to device
as simple as that:
```sh
tune2fs -U random /dev/sda1
# or a defined one
MYUUID=`uuidgen`
tune2fs -U $MYUUID /dev/sda1
# but you may even assign your defined one with the same method
```
