# Disable IPv6 on OpenWRT
```sh
# UCI settings
uci set 'network.lan.ipv6=off'
uci set 'network.wan.ipv6=off'
uci set 'dhcp.lan.dhcpv6=disabled'
/etc/init.d/odhcpd disable

# Commit changes
uci commit
```
