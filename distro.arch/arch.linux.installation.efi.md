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

5. Enable SSH:
    - `systemctl start sshd`

6. Change root password:
    - `passwd`

7. Go to [https://archlinux.org/mirrorlist](https://archlinux.org/mirrorlist) and find the closest mirror that supports HTTPS:
    - Add the mirrors on top of the `/etc/pacman.d/mirrorlist` file.
    - `Server = https://mirror.neuf.no/archlinux/$repo/os/$arch` (Norway)

8. Create EFI partition:
    - `fdisk -l` to find the designation for the HDD. (Most likely `/dev/sda`)
    - `fdisk /dev/sda`
        - g (to create a new partition table)
        - n (to create a new partition)
        - 1
        - enter
        - +300M
        - t
        - 1 (for EFI)
        - w

9. Create `/root` partition:
    - `fdisk /dev/sda`
        - n
        - 2
        - enter
        - +30G
        - w

10. Create `/home` partiton:
    - `fdisk /dev/sda`
        - n
        - 3
        - enter
        - enter
        - w

11. Create the filesystems:
    - `mkfs.fat -F32 /dev/sda1`
    - `mkfs.ext4 /dev/sda2`
    - `mkfs.ext4 /dev/sda3`

12. Create the `/root` and `/home` directories:
    - `mount /dev/sda2 /mnt`
    - `mkdir /mnt/home`
    - `mount /dev/sda3 /mnt/home`

13. Install Arch linux base packages:
    - `pacstrap -i /mnt base`

14. Generate the `/etc/fstab` file:
    - `genfstab -U -p /mnt >> /mnt/etc/fstab`

15. Chroot into installed system:
    - `arch-chroot /mnt`

16. Set the timezone:
    - `ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime`

17. Update the Hardware clock:
    - `hwclock --systohc`

18. Install boot manager and other needed packages:
    - `pacman -S grub efibootmgr dosfstools openssh os-prober mtools linux-headers linux-lts linux-lts-headers`

19. Set locale:
    - `sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen` (uncomment en_US.UTF-8)
    - `locale-gen`

20. Enable root login via SSH:
    - `sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config`
    - `systemctl enable sshd.service`
    - `passwd` (for changing the root password)

21. Create EFI boot directory:
    - `mkdir /boot/EFI`
    - `mount /dev/sda1 /boot/EFI`

22. Install GRUB on EFI mode:
    - `grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck`

23. Setup locale for GRUB:
    - `cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo`

24. Write GRUB config:
    - `grub-mkconfig -o /boot/grub/grub.cfg`

25. Create swap file:
    - `fallocate -l 2G /swapfile`
    - `chmod 600 /swapfile`
    - `mkswap /swapfile`
    - `echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab`

26. Exit, unount and reboot:
    - `exit`
    - `umount -a`
    - `reboot`

