
## Arch Linux
Install it from **wine** and everything is fine, avoid using video, sometimes it crashes
```sh
# Install wine and all those shitty lib32 deps, thank you win..
pacman -S wine winetricks

# Install cisco jabber from wine
; just open explorer and execute the jabber.exe file from there

# Install possible sound deps, so
pacman -S lib32-alsa-plugins lib32-alsa-lib lib32-libpulse lib32-alsa-oss

# Run it and enjoy, set your favorite audio card but avoid video settings, sometimes it crashes even just selecting it
```
