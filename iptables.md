
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
