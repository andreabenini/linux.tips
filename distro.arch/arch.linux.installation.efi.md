# Installing Arch linux with EFI

1. Change keyboard layout:
    - `loadkeys no`
2. Verify boot mode:
    - `ls /sys/firmware/efi/efivars` (If the directory exist your computer supports EFI)
3. Ping some site on the Internet to verify connection:
    - `ping archlinux.org`
4. Update system clock:
    - `timedatectl set-ntp true`
    - You can verify the status with `timedatectl status`
5. Enable SSH if you need to access it from a remote shell:
    - `systemctl start sshd`
    - Change root password: `passwd`
6. Switch mirrorlist with the preferred one (optional).  
    Go to [https://archlinux.org/mirrorlist](https://archlinux.org/mirrorlist) and find the closest mirror that supports HTTPS:
    - Add the mirrors on top of the `/etc/pacman.d/mirrorlist` file.
    - `Server = https://mirror.neuf.no/archlinux/$repo/os/$arch` (Norway)
7. Partition disk:
    - `fdisk -l` to find the designation for the HDD. (Most likely `/dev/sda` or `/dev/nvme0n1`)
    - `fdisk /dev/sda`
        - g (to create a new partition table with **gpt** schema)
        - create a boot partition
            - n (to create a new partition)
            - 1
            - enter
            - +900M (or desired size)
            - t
            - 1 (for EFI or "EFI System")
        - create a swap partition:
            - n
            - 2
            - enter
            - +30G (or desired size)
            - t
            - 82 (or search for "linux swap")
        - create a boot partition
            - n
            - 3
            - enter
            - enter (to fill the disk)
            - "_there's no need to change this partition type_"
        - w (to save changes on disk)
8. Format partitions
    - `mkfs.fat -F32 /dev/nvme0n1p1`  
        Fat32 partition type format if you're using an EFI system, adapt device name accordingly
    - `mkswap /dev/nvme0n1p1`  
        Create and initialize the swap partition
    - `mkfs.ext4 /dev/nvme0n1p3` 
9. Prepare system init and chroot
    - `mount /dev/nvme0n1p1 /mnt`
    - `mount --mkdir /dev/nvme0n1p1 /mnt/boot`
    - `swapon /dev/nvme0n1p2` _(enable swap)_
    - Essential packages installation
        - `pacstrap -K /mnt base linux linux-firmware (amd|intel)-ucode vim networkmanager man-db man-pages texinfo`  
            Adapt this command to AMD or Intel architecture, it's still optional but highly suggested for performances
    - Automatically generate fstab  
        `genfstab -U /mnt >> /mnt/etc/fstab`
    - Finally chroot in the new environment  
        `arch-chroot /mnt`
10. Date, time and locale setup
    - Timezone setup  
        `ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime`
    - Hardware clock sync, it also generates `/etc/adjtime` file  
        `hwclock --systohc`
    - Edit `/etc/locale.gen`, uncomment `en_US.UTF-8 UTF-8` and|or other needed locales
    - Generate the locales by running: `locale-gen`
    - Create `/etc/locale.conf` accordingly, so for example:
        ```
        LANG=en_US.UTF-8
        ```
    - Adding extra terminal fonts (totally optional, skip it if not needed)  
        - `pacman -S terminus-font`
        - `ls /usr/share/kbd/consolefonts`
        - `setfont ter-124b` (or whatsoever font you prefer)
        - `showconsolefont` to print its characters on stdout
    - Create `/etc/vconsole.conf` like:
        ```
        KEYMAP=en
        FONT=ter-124b
        ```
        `FONT=xxx` is totally optional and it depends in your personal flavors and previously executed step
11. Network configuration
    - Edit `/etc/hostname` and write your hostname there
    - `systemctl enable NetworkManager`
12. Set root password: `passwd`
13. Boot loader setup
    - Install required packages
        `pacman -S grub efibootmgr`
    - Configure and install grub  
        `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub`
    - Generate the GRUB configuration file  
        `grub-mkconfig -o /boot/grub/grub.cfg`
    - Remove optional or old EFI entries
        - `efibootmgr` to display available configurations
        - `efibootmgr -b 0000 -B`. Removes entry **"Boot0000"** from the list (for example: Windows Boot Manager)
        - run `efibootmgr` again to see changes
14. Exit, unount and reboot
    - `exit`
    - `umount -R /mnt`
    - `reboot`
