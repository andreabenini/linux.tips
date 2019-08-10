# Builtin ftpd server
Arch already has a builtin ftpd server, it's simply called `ftpd`. Simply start it with
```
systemctl start ftpd
```
and you're set, now ftp to your host using internal username-password credentials and for a quick and easy download
or file sharing you're set. If you prefer something more robust and configurable just proceed with common daemons
(vsftp, proftpd, ...)
