
**10-monitor.conf**<br/>
Here's a shitty trick to disable some video output. Intel skylake built-in HD GPU detects eDP1 output even if it's an ordinary desktop PC with no laptop LVDS or other screens. This might be a problem on the driver side (still intel) or on the kernel side (don't know where). This disables ghost monitor output on X

```
Section "Monitor"
    Identifier             "eDP1"
    Option                 "ignore"  "true"
EndSection
```
