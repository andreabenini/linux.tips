# How to configure Locales
When you see messages like `Can't set locale; make sure $LC_* and $LANG are correct!` or something like:
```
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
	LANGUAGE = (unset),
	LC_ALL = (unset),
	LC_TIME = "it_IT.utf8",
	LC_MONETARY = "it_IT.utf8",
	LC_MEASUREMENT = "it_IT.utf8",
	LC_NUMERIC = "it_IT.utf8",
	LC_PAPER = "it_IT.utf8",
	LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
```
you're probably logged in a system where locales are not properly set (as the message suggests).

To solve this kind of problem you need to:
```
# Debian based distros solution
dpkg-reconfigure locales

# Alternatively you can:
nano /etc/locale.gen
locale-gen
```
