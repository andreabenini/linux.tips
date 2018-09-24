
# VNC Server Side
Here's what you can do to install a vnc server on a linux mint (mate, cinnamon, lxde, whatever) machine

- Install x11vnc:
```
# debian, ubuntu, mint
sudo apt-get -y install x11vnc
```
- Create the directory for the password file:
```
sudo mkdir /etc/x11vnc
```
- Create the encrypted password file:
```
sudo x11vnc --storepasswd /etc/x11vnc/vncpwd
```
  You will be asked to enter and verify the password.  Then press **Y** to save the password file.
- Create the systemd service file for the x11vnc service:
```
sudo nano /lib/systemd/system/x11vnc.service
```
- Copy/Paste this code into the empty file:
```
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared

[Install]
WantedBy=multi-user.target
```
- Reload the services:
```
sudo systemctl daemon-reload
```
- Enable the x11vnc service at boot time:
```
sudo systemctl enable x11vnc.service
```
- Start the service: either reboot or 
```
sudo systemctl start x11vnc.service
```
