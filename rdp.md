## Connection to old terminal server machines
```
xfreerdp +clipboard /v:<YOUR HOST ADDRESS> /u:<YOUR USER. ie:administrator> /p:<PASSWORD> /d:<DOMAIN> /sound:sys:alsa /multimedia:sys:alsa /size:1920x1080 /kbd:0x00020409 /port:3389 /bpp:15
```

## Connection to newer machines [win 2008 and above] (sec:rdp)
```
xfreerdp +clipboard /v:<YOUR HOST ADDRESS> /u:<YOUR USER. ie:administrator> /p:<PASSWORD> /d:<DOMAIN> /sound:sys:alsa /multimedia:sys:alsa /size:1920x1080 /kbd:0x00020409 /port:3389 /bpp:15 /sec:rdp
```

## No float bar, multimonitor (and so fullscreen)
I didn't get a viable solution for `/multimon` and `/size` in the same command for a specified screen resolution.
It seems `/multimon` always does full screen on every monitor, I cannot have a splitted window between two.
You might try to specify `/size` with **WidthxHeigh** calculated as the sum of the two monitors and avoid using 
`/multimon` flag
```
xfreerdp +clipboard /v:<YOUR HOST ADDRESS> /d:<DOMAIN> /u:<YOUR USER> /multimon /p:'<THE PASSWD>' +fonts /sound:sys:alsa /multimedia:sys:alsa /f /kbd:0x00020409 -floatbar
```

### Sending Ctrl+Alt+Del
To send Ctrl+Alt+Del over an RDP connection (Example: freerdp) you need to send
- **Ctrl+Alt+End** with a common keyboard and no fancy settings
- **Ctrl+Alt+.** *[numpad]* with a USB EN/US Apple Keyboard
