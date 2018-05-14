# Rescue a broken gentoo box
when you screw an important package (mpfr, portage, binutils, ...) you're in a mess and sometimes you need a binary 
version of that package (even if it's updated) in order to fix your installation. When you destroy for example sys-apps/portage
you are in a serious problem. All you can do is:

- download a binary version of that package
- deploy it
- execute and re-emerge it in order to fix the real mess

A nice idea would be to:

- download it from tinderbox.    `lynx http://tinderbox.dev.gentoo.org/default-linux/amd64/`
- use lynx, wget or whatever you'd prefer (or you have) in order to download something
- `tar -xvjf /tmp/<your package>.tbz2  -C /`
- emerge it again: `emerge mpfr gcc [or whatever it is]`
- be wise and try to avoid it next time, you must not broke it twice !
