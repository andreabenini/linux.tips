# Power management related commands
## Detect power sources with `upower`
```sh
# Getting power sources information from main battery (if any) and AC outlet (when connected)
upower -i /org/freedesktop/UPower/devices/battery_BAT0
upower -i /org/freedesktop/UPower/devices/line_power_AC
```
