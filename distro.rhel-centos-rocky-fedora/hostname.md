# Set hostname with systemd

With systemd use `set-hostname`:
```
~# hostnamectl set-hostname hostname.domain.com
~# hostname
 hostname.domain.com

# To apply settings
~# /etc/init.d/network restart 
```
