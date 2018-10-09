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

# Clear Linux Memory Buffers
```
~ # free
              total        used        free      shared  buff/cache   available
Mem:        8053300     4423404     1878272       61200     1751624     3467344
Swap:       4194300           0     4194300
~ # sync; echo 3 > /proc/sys/vm/drop_caches
~ # free
              total        used        free      shared  buff/cache   available
Mem:        8053300     4523964     2968264      144388      561072     3286236
Swap:       4194300           0     4194300
```
As you can see buffer mem is cleared with drop_cache
