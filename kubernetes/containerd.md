# Containerd: living with corporate proxy
**Do NOT** use a proxy, _ever_, if you want to avoid headaches with containerd but for downloading files from internet you might use this one:
```ini
# Containerd systemd service file
[Service]
...
Environment="HTTP_PROXY=http://<username>:<password>@<proxyHost>:<proxyPort>/"
...
```
This doesn't grants you full privileges on forthcoming bugs but it might give you something to test to try to avoid troubles
