# Reinstall a previous kernel package from the cache
When you have no internet it's safe to reinstall the kernel using the package cache already on the drive. This is the fastest fix.  
To find the cached kernel package:
```sh
ls /var/cache/pacman/pkg/linux-*
```
Look for a file like linux-6.x.x.arch1-1-x86_64.pkg.tar.zst that matches the version listed in `/usr/lib/modules`, to reinstall 
replace the filename with the actual one found:
```sh
pacman -U /var/cache/pacman/pkg/linux-6.6.7.arch1-1-x86_64.pkg.tar.zst
```
