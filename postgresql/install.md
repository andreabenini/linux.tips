# CentOS installation
```sh
yum install postgresql-server
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
```

## auth login
On a non hardened system with basic auth requirements this should suffice
> /var/lib/pgsql/data/pg_hba.conf
```sh
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
```
Disable everything else, there's no need for: ipv6, ipv4 (on external address) or 'local' entry.
Restart when done
