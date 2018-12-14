# How to test an NTP server with `ntpdate`
The `-q` switch says to query only and not set the time.
With this command you can query an NTP server and it will return the date it has set.
```sh
~# ntpdate -q 192.168.1.222
server 192.168.1.222, stratum 2, offset 0.002692, delay 0.04167
31 Dec 23:59:59 ntpdate[1212]: adjust time server 192.168.1.222 offset 0.002692 sec
```

# Configured at start time
if ntpd is configured to run at system start, issue this command:
```sh
~# chkconfig --list ntpd
ntpd           	0:off	1:off	2:on	3:on	4:on	5:on	6:off
```
