# Random troubleshooting during updates
### `linux-firmware` update errors
When you see something like:
```log
linux-firmware-nvidia: /usr/lib/firmware/nvidia/ad103 exists in filesystem
```
The error can be solved with just a couple of commands, basically removing and reinstalling the same package again, just like:
```sh
pacman -Rdd linux-firmware
pacman -Syu linux-firmware
```
