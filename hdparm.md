# hdparm settings
Turn off Advanced Power Management from a disk, 255 is max and turns APM off
```sh
# Turn it off
hdparm -B 255 /dev/sda
# Check it out
hdparm -B /dev/sda
# You might see something like:
# /dev/sda:
#  APM_level	= off
```
