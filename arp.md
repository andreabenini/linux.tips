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
