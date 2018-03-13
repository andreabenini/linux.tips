# Create a temp swap file
Sometimes it's necessary to have a little bit more more memory for heavy duty or occasional tasks
(emerge chrome.. openoffice...) if you've some free disk it's possible to create a temp swap file from it.

```
# Create a 5Gb file
fallocate -l 5G /mnt/5GB.swap

# Chmod
chmod 600 /mnt/5GB.swap

# Making a swap file from it
mkswap /mnt/5GB.swap

# Mounting/adding it to system memory
swapon /mnt/5GB.swap

# Umount it when done
swapoff /mnt/5GB.swap
```
