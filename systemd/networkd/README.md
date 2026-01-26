# Troubleshooting
When `systemd-networkd` is used as Linux network manager it might cause problems with standalone `sshd` service, default definition might be something like:
```ini
[Unit]
Description=OpenSSH Daemon
Wants=sshdgenkeys.service
After=sshdgenkeys.service
After=network.target

[Service]
ExecStart=/usr/bin/sshd -D
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target
```
**...but...** if you want to listen to specific interfaces only (_not ANY_) it might be possible interfaces are not (yet) available when `sshd.service` is started.
In this case it's better to add:
```ini
[Unit]
...
After=systemd-networkd.service
```
To your daemon configuration.

Tested on Arch Linux, AMD64, Kernel 5.x . sshd running on specific IP addresses only, **not any interface** (default). With ANY this edit is not needed at all


## Delays from`pre-target` services (iptables, nftables), cont...
sshd is usually configured to start after `network.target`. However, network.target only indicates that
the network stack is up, not that IP addresses are assigned.
sshd starts parallel to the IP assignment process.  
When firewalling daemons or traffic checkers come into play they usually work in the pre-target space.
- Without `nftables`: The race is tight. By chance (or slightly less system load), the network interface
    lan gets its IP just before sshd tries to bind to it.
- With `nftables`: The nftables.service runs Before=network-pre.target. This shifts the boot timeline.
    While it doesn't "block" the network, the slight delay or CPU usage during rule loading shifts the
    timing enough that sshd attempts to bind before the IP is ready.  
    You might see in the logs something like: _"Cannot assign requested address"_, the IP literally
    doesn't exist on the interface yet when sshd asks for it.

**The solution**: Allow Non-Local Bind even if networking is not ready (yet).  
Something like: _"it's okay to bind to this IP even if it doesn't exist yet; it will arrive later."_  
This is handled by `net.ipv4.ip_nonlocal_bind` that completely bypasses the race condition. something like
```sh
# /etc/sysctl.d/90-nonlocal-bind.conf 
net.ipv4.ip_nonlocal_bind = 1
```
