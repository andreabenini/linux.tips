```sh
sudo dd if=/dev/sda of=/tmp/image.img bs=4M status=progress
wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh
chmod +x pishrink.sh
sudo ./pishrink.sh image.img
sudo dd if=/tmp/image.img of=/dev/sda bs=4M status=progress conv=fsync
```
