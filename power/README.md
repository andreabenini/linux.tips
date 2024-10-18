# Power management related commands
## Detect power sources with `upower`
```sh
# Getting power sources information from main battery (if any) and AC outlet (when connected)
upower -i /org/freedesktop/UPower/devices/battery_BAT0
upower -i /org/freedesktop/UPower/devices/line_power_AC
```

## Filesystem information (`/sys/class`)
Usually virtual filesystem from `/sys/class` tree contains a lot of useful information. Here are
some sources of information. absolute paths and filenames are totally dependent from the kernel
and the linux distribution but you might figure it out.
```sh
cat /sys/class/power_supply/AC/online
# 0: Running from batteries
# 1: Running from an external power source

# Take a look at /sys/class/power_supply/BAT0 (or equivalent) for suitable information about
# the current battery in case of a laptop or a similar device
```
