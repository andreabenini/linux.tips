# Gathering video card information
Here are several commands you can use to collect useful information from your video card
```sh
# classic lspci
lspci
# ...verbose information (just add more 'v's)
# 'sudo lspci' opens up additional kernel info reserved to superuser
lspci -v
lspci | grep -e VGA -e 3D

# Show kernel drivers handling each device
lspci -k

# This is one of the best tool to identify also Architecture Generations
# (from Intel for example) in order to install and load proper kernel or drivers
inxi --admin --verbosity=7 --filter --width
```
