# Apple Keyboard
## Invert F.Keys as standard function keys
Manually at runtime, one shot
```sh
echo sudoPassword | sudo -S sh -c '/usr/bin/echo 2 > /sys/module/hid_apple/parameters/fnmode'
```
