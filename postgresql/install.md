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
disable everything else, no need for ipv6, ipv4 (on ensXX) or local; restart when done
