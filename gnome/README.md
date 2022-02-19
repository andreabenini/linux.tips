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
