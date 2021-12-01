# Bridge and switch configurations for multiple nic machines

## Hints
### Multiple network interfaces, avoid initial wait time
If the system has multiple network interfaces, but some are not expected to be connected
all the time (e.g. multi-port Ethernet card, but only one cable plugged in), starting
`systemd-networkd-wait-online.service` will fail after the default timeout of 2 minutes.
This may cause an unwanted delay in the startup process. To change the behaviour to wait
for any interface rather than all interfaces to become online, edit the service and add
the `--any` parameter to the ExecStart line:

`/etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service`
```sh
# Add "--any" to systemd-networkd-wait-online
ExecStart=/usr/lib/systemd/systemd-networkd-wait-online --any
```
