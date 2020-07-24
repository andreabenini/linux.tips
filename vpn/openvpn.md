# Route only specific traffic through OpenVPN
Configure OpenVPN client to ONLY route traffic through the VPN  
These entries belong in your _.ovpn_ file and will direct all 192.168.0.* subnet traffic through the VPN.
```sh
route-nopull 
route 192.168.0.0 255.255.255.0
```
  
For one IP only (192.168.0.1):
```sh
route-nopull 
route 192.168.0.1 255.255.255.255
```
