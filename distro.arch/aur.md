# Clone/Install unsupported package from AUR
AUR is the Arch User Repository and you can find unsupported packages or something with strict end user licenses
(skype, x264, ...). pacman is not responsable for upgrading these packages, when you install something from it you're
on your own

## Requirements
list of suggested packages
- git
- binutils
- fakeroot (optional but sometimes used for packages tests)

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

## Reinstall/Repair procedures
It happened to me just once and it might be a package specific problem or something related to the application, this might be the case because the application was "zoom" (so, stop laughing). These steps solved a problem that never happened to me before.
- Remove/uninstall the package (`sudo pacman -rsn [packageName]`)
- Remove configuration files (`.config/zoom*`) or application directories (`.zoom/`)
- Remove the AUR package all at once or git reset the repo (in my case `rm -rf /usr/src/packages/zoom`)
- clone (or reset) the src repository from AUR. A git reset might be enough even if not tested it yet
- reinstall the package (`makepkg -si [pkgName]`) as usual

