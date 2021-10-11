# WiFi configuration tips

To turn off wifi/wired bridging edit `/etc/config/network`:
```conf
config interface 'lan'
    ## Comment this one ##
    #option type 'bridge'

# Add wifi interface
config interface 'wifi'
    option proto static
    option ipaddr (ip for this interface, eg. 192.168.10.1)
    option netmask (netmask, eg. 255.255.255.0)
```

Link wireless device to ‘wifi’ interface, and select AP/Client mode.
If you want to be an access point, set mode to ‘ap’. 
If you want to connect to an access point, then set mode to ‘client’.
The other settings are dual-purpose.
```conf
# /etc/config/wireless
config wifi-iface
	option network 'wifi'
	option encryption 'psk2'
	option ssid 'apName'
	option key 'apPassword'
	option mode 'ap'
	#option mode 'client'
```

Firewall configuration, add local wifi to trusted networks:
```conf
# /etc/config/firewall
config zone
    option name 'lan'
    ...
    # add this one
    option network 'wifi'
    ...
```
