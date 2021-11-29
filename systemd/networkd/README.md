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
