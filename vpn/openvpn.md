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


# Sharing a port with a web server
OpenVPN has the `port-share` option which lets you share the OpenVPN port with another application, such as an HTTPS server.

The port-share option doesn't actually let you share the port since you cannot really make two applications listen/bind
on the same port. It actually works like a port forwarder or a proxy. This option works by making your web server listen
on a different port and then letting OpenVPN forward all HTTP/HTTPS connection to your webserver.

> The OpenVPN port-share manual entry
> **--port-share host port**
> When run in TCP server mode, share the OpenVPN port with another application, such as an HTTPS server. If OpenVPN senses a
> connection to its port which is using a non-OpenVPN protocol, it will proxy the connection to the server at _host:port_.
> Currently only designed to work with HTTP/HTTPS, though it would be theoretically possible to extend to other protocols such as ssh.

### Working on it
- Make your webserver listen to a different port.
- Make OpenVPN use that port. Any non-OpenVPN traffic that goes to this port has to be forwarded to your webserver by OpenVPN.
- To make OpenVPN listen to port 443 and have other connections forwarded to your webserver, edit the configuration file and add these lines:
```conf
proto tcp
port 443
port-share 127.0.0.1 4545
```
You can now connect to your OpenVPN server on Port 443 while you can still browse your website as if it was listening also on port 443.
