# Repairing root filesystem
`fsck` usually cannot repair a filesystem that is mounted Read/Write because the OS might write to the disk while the repair tool is moving data, causing massive corruption. 
It can always be forced but it's not usually a nice idea unless you know what you're doing. Even more: when in emergency mode, the root partition is likely already mounted,
preventing the fix.
### The kernel parameter trick
- boot the computer
- When grub menu appears, highlight the selected boot option and press `e` to edit boot commands
- Find the line that starts with `linux` or `linux /boot/vmlinuz-linux`. It will end with things like `quiet` or `rw`.
  Add the following text to the very end of that line with a space before it:
  ```conf
  fsck.mode=force fsck.repair=yes
  ```
  This will force fsck checking at startup and autorepair if errors will be detected
- Press Ctrl+X (or F10) to boot.
