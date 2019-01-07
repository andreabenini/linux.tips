You can do this directly from the shutdown command, see man shutdown:
```
SYNOPSIS
   /sbin/shutdown [-akrhPHfFnc] [-t sec] time [warning message]

[...]

   time   When to shutdown.
```
So, for example:
```
shutdown -r 21:45 &
```
That will run `reboot -r` at 21:45.
