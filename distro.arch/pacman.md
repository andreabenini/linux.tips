# Query commands
## debug packages
Find installed packages with the debug flag enabled
```sh
pacman -Qtdq
```
To disable debug packages requirements or installation just:
- edit `/etc/makepkg.conf`
- in **OPTIONS** change `debug` to `!debug`

## List of installed packages
```sh
# detailed list, multiple lines per package
pacman -Qi
# one line for each single package
pacman -Qe
pacman -Qe --color=always | less -r   # With colors
```
## List orphans packages
```sh
pacman -Qdt
```
## List of files installed by a package:
```sh
pacman -Ql <packageName>
```

## Query which package provides specific filename
```sh
# Get latest package database from remote
sudo pacman -Fy
# Search locally which package provides specific filename (example: md2html)
pacman -F md2html
```
## Detect which package installed a specific file
```sh
pacman -Qo /etc/containers/registries.conf
# /etc/containers/registries.conf is owned by containers-common x:x.xx.x-x
```


&nbsp;
---
&nbsp;


# Reinstall a specific package as well as its dependencies
With a little bit of bashism here's a method to reinstall a package (graphviz in my example)
```sh
pacman -Si graphviz | awk -F ": " -v filter="^Depends" \ '$0 ~ filter {gsub(/[>=<][^ ]*/,"",$2) ; gsub(/ +/,"\n",$2) ; print $2}' | sudo pacman -S --asdeps -
```


&nbsp;
---
&nbsp;


# Remove package
```sh
pacman -Rsn <packageName>
# You are on your own if you need to remove configuration files in your $HOME directory
```
## Remove orphans packages
```sh
pacman -Rsn $(pacman -Qdtq)
```
## Remove multiple packages and their dependencies
```sh
pacman -Rnsu pack1 pack2
```

&nbsp;
---
&nbsp;


# Clear package cache
Arch Linux stores a copy of each package you download in the `/var/cache/pacman/pkg/` directory.
This includes every package you download, even upgrades. You can roll back to previous versions
in case an update breaks a package, which comes in handy on a rolling-release distro like Arch.
However it does take up a lot of space.

This command will remove any packages from the cache that are not currently installed.
Adding another -c flag in the command will remove all of the cached packages too.
```sh
pacman -Scc
```

&nbsp;
---
&nbsp;


# Pacman on PacMan
Add some fancy pacman-like animations on pacman package manager
```
- Edit /etc/pacman.conf
- From "Misc options" uncomment "Color", just remove leading '#'
- Add one line below and type "ILoveCandy" in there
- Save and enjoy a curses based pacman animation each time a progress bar is
  visible in pacman (the package manager)
```

&nbsp;
---
&nbsp;


# Unable to lock database
```sh
ben~ # pacman -Syu
:: Synchronizing package databases...
error: failed to update core (unable to lock database)
error: failed to update extra (unable to lock database)
error: failed to update community (unable to lock database)
error: failed to update multilib (unable to lock database)
error: failed to synchronize all databases
```
Easily solvable with:
```sh
rm /var/lib/pacman/db.lck
```
