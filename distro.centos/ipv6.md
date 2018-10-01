# Disable IPV6 on CentOS/RedHat

## boot parameters (requires reboot)
```
# cat /etc/default/grub
GRUB_TIMEOUT=5
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="ipv6.disable=1 crashkernel=auto rhgb quiet"
GRUB_DISABLE_RECOVERY="true"
```

Regenerate grub configuration
```
grub2-mkconfig -o /boot/grub2/grub.cfg
```

Restart machine and check how it goes
```
shutdown -r now
ip addr show | grep net6
```
