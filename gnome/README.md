# Detect xorg/x11/wayland
In order to detect where gnome is running this is quite handy:
```sh
echo "$XDG_SESSION_TYPE"
# x11|xorg|wayland
```


# gnome-shell debug
Developing gnome plugins is not too hard but it's supposed to be simpler, expecially when you need to debug your extensions.
When you need some sort of debugging with your JS hell code a console is usually nice, so run this in your favorite terminal:
```sh
# Explicitly tag gnome-shell executable
journalctl /usr/bin/gnome-shell -f -o cat

# ...or more comprehensive GNOME Shell filtering
journalctl -f | grep -E "(custom-menu-panel|extension|gnome-shell)" --color=always
```
## Looking glass
Gnome debug shell utility
- ALT+F2 (to run a command)
- lg     (to execute Looking Glass)
### debug console information
```javascript
// Current log level (int), it can be changed here too
// https://api.pygobject.gnome.org/GLib-2.0/enum-LogLevelFlags.html
// https://docs.gtk.org/glib/flags.LogLevelFlags.html
GLib.LogLevelFlags.LEVEL_MESSAGE
```


# Nautilus
## Show Hidden Files by default
- `dconf` editor
- Path `/org/gnome/nautilus/preferences`
- Flag `show-hidden-files`, turn it **on**


# Shortcuts
> **`<Super> <Space>`** Change keyboard layout


# Troubleshooting
### Directory or files association
```ini
# Display mime type association
~$ gio mime inode/directory
Default application for “inode/directory”: code.desktop
Registered applications:
	code.desktop
	org.gnome.Nautilus.desktop
Recommended applications:
	code.desktop
	org.gnome.Nautilus.desktop
```
This output reports `vscode` as default application associated to folder opening,
I can change it to something else with:
```ini
~$ gio mime inode/directory org.gnome.Nautilus.desktop
Set org.gnome.Nautilus.desktop as the default for inode/directory
```
