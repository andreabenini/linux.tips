Quick and dirty commands used when dealing with OpenWRT based devices

### Restoring device to factory default
Quick and dirty restore of the rootfs data (__/overlay__ dir) where user configuration are stored.
```sh
# As simple as that, use mtd utility. Reboot comes immediately after it
mtd -r erase rootfs_data

# This is brutal but you may even use:
rm -rf /overlay && reboot

# When you're in failsafe mode you may use this command:
firstboot
```
Device will be restored from scratch, default networking and whole image settings are fully applied to it
