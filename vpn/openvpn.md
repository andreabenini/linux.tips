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

# Detect if OpenVPN is blocked
When you're behind a corporate firewall my might need to detect if OpenVPN is blocked in some way, this
one liner script might be your best friend:
```sh
echo -e "\x38\x01\x00\x00\x00\x00\x00\x00\x00" | timeout 10 nc -u <HostNameOrIPAddress> 1194 | cat -v
```
If after a specified timeout (_10s_ as state above) you don't see an output it means some as...le is blocking you. 
If a VPN connection can be established you might see a string like `@I0tlT?M-DM-@^@^@^@^@^@` coming by after a
configured period of time.  
By default the OpenVPN Access Server comes configured with OpenVPN daemons that listen on port 1194 UDP,
and OpenVPN daemons that listen on port 443 TCP.  
While the best connection for an OpenVPN tunnel is via the UDP port, they implement TCP 443 as a fallback method.
