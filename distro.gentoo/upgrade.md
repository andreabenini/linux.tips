# Upgrade tips:
few hints occurred when upgrading system, gotchas and quirks here and there

## Full upgrade, single packet
So you can pass to your script a variable number of arguments
```
emerge --verbose-conflicts --update --newuse --deep $@
# equal to:   emerge --verbose-conflicts --update --newuse --deep chromium icu qtcore
```

## upgrade QT
```
# briefly: uninstall all/reinstall all

# List all installed qt packages:
export INSTALLED_QT_PACKAGES=$(eix --only-names -IC dev-qt)
# Save tarballs of the old versions should we have to roll back:
quickpkg ${INSTALLED_QT_PACKAGES}
# Unmerge old version and emerge new version:
emerge -Ca ${INSTALLED_QT_PACKAGES} && emerge -av1 ${INSTALLED_QT_PACKAGES}

# Should we need to roll back ? then we can emerge the packaged versions:
# don't do that unless necessary
emerge -av1 --usepkgonly ${INSTALLED_QT_PACKAGES}
```
credits: https://wiki.gentoo.org/wiki/Qt/FAQ

## upgrade perl
```
# life saver
perl-cleaner --reallyall
```
credits: https://wiki.gentoo.org/wiki/Perl
