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

# gnome-shell under wayland for developing plugins
This is a real pain mostly because:
- Alt+F2, 'r' is not possible because wayland does NOT have an independent client/server structure.
  Reloading an entire environment is not possible.
- disabling/enabling a plugin does not always work because it's not reloading sources on nested files
  and it's pretty lame due to that
- dbus messages and halting certain parts of the display server is not safe at all
- logout/login process always works but it's also pretty lame if you're developing an extension
- The real working option consists in starting a new session inside a shell. Something like:
```sh
    dbus-run-session -- gnome-shell --nested --wayland

    # Even better, if you'd like to have a large window screen just use something like:
    # MUTTER_DEBUG_DUMMY_MODE_SPECS=1440x900 dbus-run-session -- gnome-shell --nested --wayland
```
which is ugly but seems to be the most reliable option for it


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
