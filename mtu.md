# MTU Size
## Detecting proper MTU size for PPP/PPPoE/cellular/mobile connections:
```sh
ping -c 1 -s $((1500-28)) -M do www.google.com
# PING www.google.com (216.58.209.36) 1472(1500) bytes of data.
# From 192.168.1.1 icmp_seq=1 Frag needed and DF set (mtu = 1454)
#
#--- www.google.com ping statistics ---
#0 packets transmitted, 0 received, +1 errors
```
The example above might suggests you to set MTU to 1454 to proper match your ppp over ethernet connection.  
In the next one the default 1500 is fine:
```sh
ping -c 1 -s $((1500-28)) -M do www.archlinux.org
#PING www.archlinux.org (95.217.163.246) 1472(1500) bytes of data.
#1480 bytes from archlinux.org (95.217.163.246): icmp_seq=1 ttl=46 time=51.6 ms
#
#--- www.archlinux.org ping statistics ---
#1 packets transmitted, 1 received, 0% packet loss, time 0ms
#rtt min/avg/max/mdev = 51.569/51.569/51.569/0.000 ms
```

## Setting MTU Size on a network interface
Root access is obviously required
```sh
# Setting MTU size to 1000b on tun0 network interface
# Useful for tweaking with some mobile operators ip settings: [openvpn]+[mobile phone]. (iliad+openvpn)
sudo ip link set tun0 mtu 1350
```
