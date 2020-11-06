# Enabling multilib libraries
This is a bad, bad, bad idea to enable multilib on a reliable amd64 system but:
- if you're running wine you need that
- if you play certain closed source games you need that (change game btw)
- flash (ahahah) or other fancy closed deps

source credit (https://wiki.archlinux.org/index.php/Official_repositories#multilib)

edit `/etc/pacman.conf`
```
# uncomment these lines (already there on default installations)
[multilib]
Include = /etc/pacman.d/mirrorlist
```
Update local repository
```
pacman -Sy
```
Install wine
```
pacman -S wine winetricks
```
