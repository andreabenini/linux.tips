# Linux games tips
## Controller
#### detection
go through dmesg as usual:
```sh
dmesg --follow
# and see what happens there
```
#### testing
`joyutils` package is always handy for basic troubleshooting, install it and command line tools are provided.
Usually joystick/gamepad devices are available under `/dev/input/` so you probably see them labeled as:
- /dev/input/js0
- /dev/input/js1
- /dev/input/pad0...
```sh
# so this is a barebone key test utility provided by `joyutils` package
jstest /dev/input/js0
```
