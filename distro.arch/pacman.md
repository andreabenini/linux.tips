# List of installed packages
```sh
# detailed list, multiple lines per package
pacman -Qi
# one line for each single package
pacman -Qe
```

# List orphans packages
```sh
pacman -Qdt
```

# Remove package
```sh
pacman -Rsn <packageName>
# You are on your own in order to remove configuration files in your $HOME directory
```

# Remove orphans packages
```sh
pacman -Rsn $(pacman -Qdtq)
```

# Remove multiple packages and their dependencies
```sh
pacman -Rnsu pack1 pack2
```


# Pacman on PacMan
Add some fancy pacman-like animations on pacman package manager
```
- Edit /etc/pacman.conf
- From "Misc options" uncomment "Color", just remove leading '#'
- Add one line below and type "ILoveCandy" in there
- Save and enjoy a curses based pacman animation each time a progress bar is
  visible in pacman (the package manager)
```
