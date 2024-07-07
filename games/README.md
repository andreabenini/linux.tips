# Linux games tips
## Controller
### detection
go through dmesg as usual:
```sh
dmesg --follow
# and see what happens there
```
### testing
#### `joyutils`
package is always handy for basic troubleshooting, install it and command line tools are provided.  
Usually joystick/gamepad devices are available under `/dev/input/` so you probably see them labeled as:
- /dev/input/js0
- /dev/input/js1
- /dev/input/pad0...
```sh
# so this is a barebone key test utility provided by `joyutils` package
jstest /dev/input/js0
```
#### raw device connection
- You should be able to find a new device: `/dev/input/js0` and/or a file ending with **-event-joystick** in
`/dev/input/by-id` directory
- `cat` those devices to see if the joystick works
— move the stick around, press all the buttons
- you should see mojibake printed when you move the sticks or press buttons

#### web interface
- Go to https://hardwaretester.com/gamepad
- press buttons or move sticks around to get it from the fancy web page
