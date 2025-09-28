# Iptables save & restore
```sh
# Save iptables structure to a local file
iptables-save -f iptables.backup
# Flush iptables and do your own things
iptables -F
iptables -L
...
# Restore previous iptables structure from file
iptables-restore iptables.backup
```
# quick howto
## Default policies on chains
```sh
# Accept connections by default
iptables --policy INPUT ACCEPT
iptables --policy OUTPUT ACCEPT
iptables --policy FORWARD ACCEPT
# Deny connections by default
iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP
```
## Allowed responses:
- **Accept**: Allow connection
- **Drop**: Drop connection like it never happened. Preferred if you don’t want the source to realize your system exists.
- **Reject**: Don’t allow connection but send back an error. You don’t want source to connect but want to know that firewall blocked.

## Allow/block connections
Useful examples on connections
```sh
# Drop connection from source ip 10.10.10.10
iptables -A INPUT -s 10.10.10.10 -j DROP
# Drop connection from network
iptables -A INPUT -s 10.10.10.0/24 -j DROP
    # same as: iptables -A INPUT -s 10.10.10.0/255.255.255.0 -j DROP
# Drop ssh connections from source: 10.10.10.10
iptables -A INPUT -p tcp --dport ssh -s 10.10.10.10 -j DROP
# Drop ssh connections from ANY
iptables -A INPUT -p tcp --dport ssh -j DROP
# Drop ssh connections to 10.10.10.10 but accept ssh connections from 10.10.10.10
iptables -A INPUT  -p tcp --dport ssh -s 10.10.10.10 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22  -d 10.10.10.10 -m state --state ESTABLISHED     -j ACCEPT
```
