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
# Default policies on chains
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
