# Apple Keyboard
Tested on:
- Apple slim aluminum keyboard (0220)


## Invert F.Keys as standard function keys
Available Modes
| Value | Mode       | Description |
| ----- | ---------- | ----------- |
| 0     | disabled   | Disable the 'fn' key. Pressing 'fn'+'F1' will behave like you only press 'F1' |
| 1     | fkeyslast  | Function keys are used as last key. Pressing 'F1' key will act as a special key. Pressing 'fn'+'F1' will behave like a F1 |
| 2     | fkeysfirst | Function keys are used as first key. Pressing 'F1' key will behave like a F1. Pressing 'fn'+'F1' will act as special key (light -) |

Manually at runtime, one shot
```sh
echo sudoPassword | sudo -S sh -c '/usr/bin/echo 2 > /sys/module/hid_apple/parameters/fnmode'
```

System wide, using modprobe
```sh
# Create a hid_apple.conf file with this new configuration
sudo echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf

# Regenerate initramfs
mkinitcpio -P
```

### Keyboard setup
Show current settings:
```sh
ls /sys/module/hid_apple/parameters/
```

### References:
- https://wiki.archlinux.org/title/Apple_Keyboard
- https://help.ubuntu.com/community/AppleKeyboard
