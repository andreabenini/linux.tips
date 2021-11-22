# Create a secure tunnel with SSH as a systemd Service
- Create `/etc/systemd/system/sshtunnel@.service` with these contents:
```systemd
[Unit]
Description=Manage a secure tunnel to %I
After=network.target

[Service]
Environment="LOCAL_ADDR=localhost"
EnvironmentFile=/etc/default/sshtunnel@%i
ExecStart=/usr/bin/ssh -NT -o ServerAliveInterval=60 -o ExitOnForwardFailure=yes -L ${LOCAL_ADDR}:${LOCAL_PORT}:${REMOTE_HOST}:${REMOTE_PORT} ${TUSER}@${TARGET}
# Restart every >2 seconds to avoid StartLimitInterval failure
RestartSec=5
Restart=always
[Install]
WantedBy=multi-user.target
```
> ${LOCAL_ADDR} - Local ip to bind the tunnel  
> ${LOCAL_PORT} - Local port of the local ip  
> ${REMOTE_HOST} - Remote host end of the tunnel  
> ${REMOTE_PORT} - Remote host port end of the tunnel  
> ${TARGET} - SSH gateway between the local machine and the remote server  
> ${TUSER} - SSH username gateway  
- Create file `/etc/default/sshtunnel@mytunnel1`
```ini
TARGET=remotehost
TUSER=ben
LOCAL_ADDR=127.0.0.1
LOCAL_PORT=49998
REMOTE_PORT=443
REMOTE_HOST=192.168.10.1
```
- Reload systemd services with `systemctl daemon-reload`

Now you have a properly configured service with some tunnel information.

## Operations
Systemd has now full access and you may use common commands to deal with it:
- Check status  
  `systemctl status sshtunnel@mytunnel1`
- Start tunnel  
  `systemctl start sshtunnel@mytunnel1`
- Stop tunnel  
  `systemctl stop sshtunnel@mytunnel1`
- Enable tunnel at boot  
  `systemctl enable sshtunnel@mytunnel1`

