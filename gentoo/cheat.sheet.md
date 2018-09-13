## Package management

### Sync methods
Sync all repositories that are set to auto-sync including the Gentoo ebuild repository:

```~# emaint -a sync```

Sync the Gentoo ebuild repository using the mirrors by obtaining a snapshot that is (at most) a day old:

```~# emerge-webrsync```

Sync custom package repository and the Gentoo ebuild repository using `eix`:

```~# eix-sync```

If there are overlays created by `app-portage/layman`, to sync them:

```~# layman -S```

`app-portage/layman` can be installed by issuing:

```~# emerge -a app-portage/layman```

`app-portage/eix` can be installed by issuing:

```~# emerge -a app-portage/eix```

Gather more information on `eix` by reading its manual:

```~# man eix```

### Package listings

qlist is provided by `app-portage/portage-utils`

List installed packages with version number and name of used overlay:

```~# qlist -IRv```

### Package installation and removal

In the following tips `www-client/firefox` will be used as an example,
substitute Firefox with the package of interest to perform the actions on another package.

List what packages would be installed without installing them:

```~# emerge -pv www-client/firefox```

Install a specific version of a package (Use '\=' if your shell attaches meaning to '='):

```~# emerge =www-client/firefox-24.8.0```

Install a package but excluding it from the world file:

```~# emerge --oneshot www-client/firefox```
<br>or<br>
```~# emerge -1 www-client/firefox```

Remove a package that no other packages depend on:

```~# emerge -cav www-client/firefox```

Remove a package even if it is needed by other packages:

```~# emerge -C www-client/firefox```

**Warning** Use with caution. This can break software.  Best if used to temporarily remove to satisfy a hard block.

Remove packages no longer needed:

```~# emerge -av --depclean```

As a safety measure, depclean will not remove any packages unless ***all*** required dependencies have been resolved.
As a consequence of this, it often becomes necessary to run:

```~# emerge --update --newuse --deep --quiet @world```

Avoid unnecessary rebuilds when USE flags only get added to or dropped from the repository and use the 
`--quiet` flag for quicker execution:

```~# emerge --update --changed-use --deep --quiet @world```

### Package upgrades

Upgrade all installed packages, dependencies, and deep dependencies that are outdated or have USE flag changes
(avoiding unnecessary rebuilds when USE changes have no impact):

```~# emerge -uDU --keep-going --with-bdeps{{=}}y @world```

### Package troubleshooting

Check for and rebuild missing libraries (not normally needed):

```~# revdep-rebuild -v```

`equery` is part of `app-portage/gentoolkit`. You can obtain it by issuing this command:

```~# emerge -a gentoolkit```

Tell which installed package provides a command using `equery`:

```~# equery b `which vim` ```

Tell which (not) installed package provides a command using `e-file`:

```e-file vim```

Install e-file with:

```~# emerge -a app-portage/pfl```

Tell which packages depend on a specific package (cat/pkg in the example) using `equery`:

```~# equery d www-client/firefox```

Get information about a package using `eix`:

```~# eix www-client/firefox`

Do not unemerge glibc. It is needed by nearly everything. After this you may need a rescue stick/disk.

If it happens, that you need to rebuild glibc you can fetch it from
`PORTAGE_BINHOST="http://packages.gentooexperimental.org/packages/amd64-stable/"`

### Portage enhancements

A graphical user interface to use with the Portage tree:

```~# porthole```

Manage configuration changes after an emerge completes:

```~# dispatch-conf```

### After installations or updates

After updating `perl`-core packages:

```~# perl-cleaner --all```

or if previous didn't help:

```~# perl-cleaner --reallyall -- -av```

For `haskell` packages:

```~# haskell-updater```

## USE flags

Obtain descriptions and usage of the USE flag `X` using `euse`:

```~# euse -i X```

Gather more information on `euse` by reading its manual page:

```~# man euse```

Obtain a description of the `png` USE flag:

```~# euse -i ! grep png```

Show what packages have the `mysql` USE flag:

```~# equery hasuse mysql```

Show what packages are currently built with the `mysql` USE flag:

```~# eix --installed-with-use mysql```

Show what USE flags are available for a specific package:

```~# equery uses <package-name>```

Quickly add a required USE flag for a package install:

```~# echo 'dev-util/cmake -qt5' >> /etc/portage/package.use```

### Important Portage files :/etc/portage</ref>

* /etc/portage/make.conf - Global settings (USE flags, compiler options).
* /etc/portage/package.use - USE flags of individual packages. Can also be a folder containing multiple files.
* /etc/portage/package.accept_keywords - Keyword individual packages; e.g. `~amd64`, `~x86`, or `∼arm`.
* /etc/portage/package.license - Accepted licenses
* /var/lib/portage/world - List of explicitly installed package atoms.
* /var/db/pkg - Contains for every installed package a set of files about the installation.

## Log management

### genlop

`genlop` is a Portage log processor, also estimating build times when emerging packages.

Install `genlop` by issuing:

```~# emerge -a app-portage/genlop```

You can gather more information on `app-portage/genlop by reading its manual page:

```~# man genlop```

View the last 10 emerges (installs):

```~# genlop -l ! tail -n 10```

View how long emerging LibreOffice took:
 
```~# genlop -t libreoffice```

Estimate how long `emerge -uND --with-bdeps=y @world` will take:

```~# emerge -pU @world ! genlop --pretend```

Watch the latest merging ebuild during system upgrades:

```~# watch genlop -unc```

## Overlays

### eselect repository
`app-eselect/eselect-repository` can be installed by issuing:

```emerge -a app-eselect/eselect-repository```

List all existing overlays:

```eselect repository list```

List all installed overlays:

```eselect repository list -i```

See also `Eselect/Repository`

### Layman

`app-portage/layman` can be installed by issuing:

```~# emerge -a app-portage/layman```

List all existing overlays:

```~# layman -L```

List all installed overlays:

```~# layman -l```

See also `Layman`

## Services

Obtain root shell (if the current user is listed in the sudoers list):

```~# sudo -i```

### OpenRC

Start the ssh daemon in the default runlevel at boot:

```~# rc-update add sshd default```

Start the sshd service now:

```~# rc-service sshd start```

Check if the sshd service is running:

```~# rc-service sshd status```

### systemd

Start the ssh daemon at boot:

```~# systemctl enable sshd```

Start the sshd service now:

```~# systemctl start sshd```

Check if the sshd service is running:

```~# systemctl status sshd```

## Gentoo Monthly Newsletter (GMN)

Search packages in Portage by regular expressions:

```emerge -s "%^python$"```

Overlays vary from very small to very large in size. As a result they slow down the majority of Portage operations.
That happens because overlays do not contain metadata caches. The cache is used to speed up searches and the building
of dependency trees. A neat trick is to generate local metadata cache after syncing overlays.

```~# emerge --regen```

This trick also works in conjunction with eix. `eix-update` can use metadata cache generated by `emerge –-regen`
to speed up things. To enable this, add the following variable to `/etc/eixrc/00-eixrc`:

```
filename=/etc/eixrc/00-eixrc

OVERLAY_CACHE_METHOD="assign"
```

### qcheck

Use `qcheck` to verify installed packages:

```~# qcheck -e vim-core```

`qcheck` comes with `app-portage/portage-utils` and can be installed by running this command:

```~# emerge -a app-portage/portage-utils```

Learn more about `qcheck` by reading its manual page:

```man qcheck```

## External resources

* [https://github.com/jonasstein/gentoo-cheat Original gentoo-cheat repository]
* [https://forums.gentoo.org/viewtopic-p-7370146.html Forum post about gentoo-cheat]
* [http://bradleymacomber.com/ref/Gentoo/ Another Gentoo cheat sheet]
* [https://forums.gentoo.org/viewtopic-t-529919.html Collection of Gentoo tips]
* [http://wikigentoo.ksiezyc.pl/Newbie_cheat_sheet.htm Newbie cheat sheet]
