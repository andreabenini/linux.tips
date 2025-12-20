# Diagnostics
In order to diagnose what's wrong in the boot process you probably need to see some messages on the screen, collect logs, attach a console terminal or something like that. For example, to diagnose the boot process you can:
- edit your current grub boot option by pressing: 'e'
- remove `splash=silent quiet` when present
- eventually add `nomodeset` in the same line to avoid issues with graphic cards

# Boot Issues
## Getting started
Before messing around with software updates or configuration is always better to:
```sh
# Distribution upgrade
sudo zypper dup
#...even better, start with Packman updates before doing something else..
sudo zypper dup --from packman

# Packages updates
sudo zypper update
```

## Graphic Card Issues
I usually don't have these problems with Arch Linux but SUSE does not always properly deal with proprietary graphic card drivers, in this case the suggested way for solving the problem is forcing the kernel and graphic card driver update.
### amd
```sh
# Force uCode and GPU card updates
sudo zypper install -f ucode-amd kernel-firmware-amdgpu libamd2 libdrm_amdgpu1
# Force firmware reinstallation as well as grub update (and mkinitrd when necessary)
sudo zypper install -f ucode-amd kernel-firmware-amdgpu libamd2 libdrm_amdgpu1
```

**NOTE**  
Blacklisting module drivers for a previously running system is not an option, if you ever installed on your own something that might break please try to remove before proceeding.
A package update does not usually screw with modules so if the system is not booting it does not make sense to blacklist them

