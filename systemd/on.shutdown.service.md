# Execute a service before shutdown
Easy and effective solution to notify someone else you're powering down a machine
```ini
# /etc/systemd/system/notifyshutdown.service
[Unit]
Description=Notify before Shutdown
DefaultDependencies=no
Before=halt.target shutdown.target reboot.target

[Service]
Type=oneshot
ExecStart=/opt/myservice/notifyshutdown.sh
RemainAfterExit=yes

[Install]
WantedBy=halt.target shutdown.target reboot.target
```
