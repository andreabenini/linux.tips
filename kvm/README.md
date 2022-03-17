## Troubleshooting
- Unable to add default bridge/Unable to start network, operation not supported
```sh
# first list network interfaces list
~$ sudo virsh net-list --all
 Name      State      Autostart   Persistent
----------------------------------------------
 default   inactive   no          yes

# Restart network virtual interface stack
~$ sudo virsh net-start default
Network default started
```