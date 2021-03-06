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

## Dealing with multiple monitors and full scren mode
To get a list of connected monitors you can use:
```sh
xfreerdp /monitor-list
```
Start full screen on monitor:
```sh
# 2: third monitor
xfreerdp /monitors:2 /multimon /v:<host>
# /f: fullscreen, get resolution from current computer monitor. Really useful.
xfreerdp /f
```
Or full screen multiple monitors:
```sh
xfreerdp /monitors:1,2 /multimon /v:<host>
```
**NOTE: Second monitor is _/monitors:1_ !**

### Sending Ctrl+Alt+Del
To send Ctrl+Alt+Del over an RDP connection (Example: freerdp) you need to send
- **Ctrl+Alt+End** with a common keyboard and no fancy settings
- **Ctrl+Alt+.** *[numpad]* with a USB EN/US Apple Keyboard


# Open RDP files from GNOME Nautilus File Manager
To simply associate `freerdp` (or `xfreerdp`) to .RDP files you just need to create two files: a launcher script and a
desktop association.  
Firstly an helper script is useful, place it in `/usr/bin` or wherever you'd like:
```
$ cat rdp.sh 
#!/usr/bin/env bash
gnome-terminal -x bash -c "/usr/bin/xfreerdp $1"
```
This script simply opens an **rdp** file with `xfreerdp` but instead of launching it directly it uses the _gnome-terminal_ 
(or your favorite terminal) application, this gives you the possibility to interact with the RDP file or the remote host.
If you need to evaluate remote security certs (so xfreerdp is warning you about remote certificates) or you need to enter a
user/password for remote authentication you basically need a terminal. You may use your favorite one, in this case `gnome-terminal` is what I use because it's already available in the gnome-shell. Terminal disappears after establishing
the connection but it's needed if you'd like to start *rdp* files from *Nautilus*.  
Now you need a *.desktop* launcher for starting this application, this is also needed if you'd like to associate *rdp* files
with it and have it available from the **Open With...** gnome application selector. Here's:
```
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Name=Remote Desktop (rdp)
GenericName=RDP File Opener
Icon=/usr/share/icons/gnome/256x256/apps/krfb.png
Exec=/usr/bin/rdp.sh %F
Comment=Open RDP files from explorer or command line
Categories=Development;IDE;
MimeType=text/plain;
Terminal=false
Type=Application
StartupNotify=true
```
Copy it to `/usr/share/applications/rdp.desktop` so it's system wide available and not just for one user only.

# X11 Wrapper Script
This is just a simple script, `zenity` and `xfreerdp` are mandatory, just a quick wrapper for **QuickToggler** (or similar GnomeExtensions):
```sh
#!/usr/bin/env bash
#
# Remote desktop wrapper for quick connections
#        zenity and xfreerdp required
#
SCREEN_SIZE=1920x1080           # Current screen size
KEYBOARD=0x00020409             # US International
OPTIONS="/cert-ignore"          # Ignore certificate trust question
#OPTIONS="/monitors:2 /multimon"# Multimonitor setup
#OPTIONS="/f"                   # Full screen

dialogEntries=$(zenity --title "Remote Destop" --forms --text="host details" \
                       --add-entry "host" --add-entry="domain" --add-entry="username" --add-entry="password")
host=$(echo "$dialogEntries"     | cut -d'|' -f 1)
domain=$(echo "$dialogEntries"   | cut -d'|' -f 2)
username=$(echo "$dialogEntries" | cut -d'|' -f 3)
password=$(echo "$dialogEntries" | cut -d'|' -f 4-)

$(which xfreerdp) +clipboard /v:$host /d:$domain /u:$username /p:"$password" /size:$SCREEN_SIZE /kbd:$KEYBOARD $OPTIONS
```

### [QuickToggler](https://extensions.gnome.org/extension/1077/quick-toggler/) (Gnome Extension) entry
Inside `.entries.json` file this is the required entry for above script:
```json
    {
      "type": "launcher",
      "title": "RDP Desktop",
      "command": "$HOME/bin/rdp.generic"
    },
```
