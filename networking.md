## Add an alias with a new ip address on a different port
```sh
ifconfig eth0:0 192.168.11.22 netmask 255.255.255.0 up
```

# Route
### route pretty print
```sh
ip route |column -t
```

## Add a manual route to your eth device
(_dev eth..._) might be omitted  
_**ip route**_
```sh
ip route add 192.168.5.0/24 via 10.0.0.1 dev eno1
```
_**route add**_
```sh
route add -net 192.168.5.0 netmask 255.255.255.0 gw 10.0.0.1 dev eno1
```

## Manually delete a route
```sh
ip route delete 192.168.0.0/24 via 192.28.0.108
```
