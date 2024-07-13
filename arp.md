# Showing arp entries
as simple as that:
```
arp -a
arp -n
```
_arp is now deprecated in favor of **ip** utils_, this is the equivalent command
```sh
ip neigh show
```

# (incomplete) entries
ARP table might contain (incomplete) entries, these are not a problem and not present in the arp table any more
(read: https://serverfault.com/questions/476272/arp-delete-is-not-deleting-an-entry-merely-marks-entry-as-incomplete), so just
wait until the system removes them.
If you want to force them out anyway you need to explicitly flush out the arp table by clearing it, just do this if you know 
what you are doing

```
ip link set arp off dev eno1
ip link set arp on  dev eno1
```

# Clearing arp cache manually
You can remove a single entry just by typing:
```
arp -d 192.168.1.1
```
arp utility does not accept an option to clear the full cache

with `ip` utility you may do something more useful if you need to clear the whole cache, something like that:
```
ip -s -s neigh flush all
```
The first `-s` will provide a more verbose output. By adding one more, we can select the neighbor table, if your `ip` utility doesn't support the `-s` flag just remove it
