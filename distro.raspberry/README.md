# Clone SD card for backup purposes
_and shrink it in between_

```sh
# Make the copy
sudo dd if=/dev/sda of=/tmp/image.img bs=4M status=progress

# Optional, shrink the image, any image for RPi works
wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh
chmod +x pishrink.sh
sudo ./pishrink.sh image.img

# Flash it back on a new device
sudo dd if=/tmp/image.img of=/dev/sda bs=4M status=progress conv=fsync
```
