# Share part of your screen with usual collaboration platforms
If you want to share a part of your monitor with your peers you're usually not allowed by common conferencing
platforms (Zoom, Meet, Teams, Slack, ...), there are no options focused on it even if ultra wide monitors are
becoming more popular, it's always a mess to deal with an ultra wide monitor when you want to share something
to your peers.  
Sometimes you get lucky and you only need to share a single application but when you have more than one (Chrome, Terminal, code, ...) this might be an issue.  
To solve it you can simply create a framebuffer device in a window and share the single window with your favorite
collaboration app, this won't solve mirroring or performance issues (you're still limited by frame rate) but
it's a decent solution for a long term session with peers.  
**vlc** comes handy in these cases, if you take a look at example below it simply shares a virtual 1K resolution monitor, from there you only need to share that window only (named 'vlc').


```sh
# Sharing screen, change it accordingly to your needs
#       - top left (0x0) with a 1920x1080 size (1k FullHD), 
#       - higher FPS might affect your network bandwidth
vlc \
    --no-video-deco \
    --no-embedded-video \
    --screen-fps=20 \
    --screen-top=0      --screen-left=0 \
    --screen-width=1920 --screen-height=1080 \
    screen://
```

### Example script for dealing with it
You can obiously add input parameters if needed, as a sample this is a fixed one:
```sh
#!/usr/bin/env bash
#
# Self contained utility for sharing just one portion of the screen
#     - Useful for conferencing tools where partial screen sharing is not supported (@all)
#     - Fully parametric across 'vlc' options, feel free to adjust it
#     - Using 'cvlc', the command line version of vlc, user interface is not needed at all
#     - Ctrl-C to stop sharing
#
TOP=0
LEFT=0
WIDTH=1920
HEIGHT=1080
FRAMES=20

echo -e "\n\nSharing portion of the screen [$TOP,$LEFT] (${WIDTH}x${HEIGHT}) @${FRAMES}fps\n\n"
cvlc \
    --no-video-deco           \
    --no-embedded-video       \
    --screen-fps=$FRAMES      \
    --screen-top=$TOP         \
    --screen-left=$LEFT       \
    --screen-width=$WIDTH     \
    --screen-height=$HEIGHT   \
    screen://
```
