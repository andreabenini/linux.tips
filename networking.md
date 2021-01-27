## Add an alias with a new ip address on a different port
```sh
ifconfig eth0:0 192.168.11.22 netmask 255.255.255.0 up
```

## Add a manual route to your eth device
(_dev eth..._) might be omitted
```sh
ip route add 192.168.5.0/24 via 10.0.0.1 dev eno1
```
