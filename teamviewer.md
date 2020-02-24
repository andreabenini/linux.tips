# wine error with core dump
Dirty hack for dealing with this weird error:
```
./teamviewer
Init...
XRandRWait: No value set. Using default.
XRandRWait: Started by user.
Checking setup...
wine: loadlocale.c:130: _nl_intern_locale_data: Assertion `cnt < (sizeof (_nl_value_type_LC_TIME) / sizeof (_nl_value_type_LC_TIME[0]))' failed.
./tv_bin/script/tvw_profile: line 142:  5460 Aborted                 (core dumped) wine regedit "$tweakfile"
```
Seems that locales are not properly in the way wine wants, basically after setting `LC_ALL` to `C` locale everything is fine,
so something like
```
LC_ALL=C ./teamviewer
```
will fix the problem
