# gnome-shell debug
Developing gnome plugins is not too hard but it's supposed to be simpler, expecially when you need to debug your extensions.
When you need some sort of debugging with your JS hell code a console is usually nice, so run this in your favorite terminal:
```sh
journalctl /usr/bin/gnome-shell -f -o cat
```
and reload the whole gnome environment (X11: `<alt>+<f2>`, `'r'`.   Wayland: Logout/Login) as usual


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
