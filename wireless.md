# WiFi common commands
List available wifi networks
```
iw dev wlp3s0 scan |egrep "SSID:"
```

Show current connection status
```
iw dev wlp3s0 info
```
