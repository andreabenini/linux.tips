# SDB:Installing codecs from Packman repositories
You need to play online or offline multimedia content but the content does not want to play or shows errors.  
Usually this is a sign of missing codecs: install these packages from Packman to play most music and video:
```txt
ffmpeg
gstreamer-plugins-good
gstreamer-plugins-bad
gstreamer-plugins-ugly
gstreamer-plugins-libav
libavcodec
vlc-codecs
```
You can get them using zypper, opi or YaST. Suggested method: `opi`
```sh
sudo zypper install opi
opi codecs
```
After you have installed codecs with `opi` check carefully if vlc-beta has been installed, if it's there execute `opi codecs` twice in order to get a rid of it, the script plays it nice, don't do that manually.  
Also pay attention to chrome/chromium if you see a blank screen inside a page instead of regular content you need to:
- run it manually with gpu accel disabled, something like: `chromium --disable-gpu`
- clear cache, browsing history, cookies and cached data
- close the browser and open it back again, if you spot strange behaviours around Gnome logout from your current session too

