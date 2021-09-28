# CygwinX, and X11 forwarding connection refused
By default CygwinX no longer listens for tcp connections, Cygwin SSH is using Unix sockets to connect.
To enable tcp connections "-listen tcp" needs to be added to the command line parameters.

```sh
# '-listen tcp' is what you need to have it working but
# ' -- -multiwindow -listen tcp' to enable also multiwindow and other features
# so this might be fine:
C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "cd; /usr/bin/startxwin -- -multiwindow -listen tcp"
```
Windows firewall complains (as usual) about this new setting so you need to confirm it before opening.
Old school var setup is needed in your terminal as usual:
```sh
export DISPLAY=127.0.0.1:0.0
```
to have X Applications working
