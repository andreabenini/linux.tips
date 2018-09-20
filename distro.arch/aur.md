# Clone/Install unsupported package from AUR
AUR is the Arch User Repository and you can find unsupported packages or something with strict end user licenses
(skype, x264, ...). pacman is not responsable for upgrading these packages, when you install something from it you're
on your own

## Installation
clone requested package from AUR (with an unprivileged user)
```
git clone https://aur.archlinux.org/ttf-ms-fonts.git
```
enter in the cloned repo dir and make the package
```
cd ttf-ms-fonts
makepkg -si
```
At the end of the installation process an arch package file is created and root access is required to finally install
the binary pkg
