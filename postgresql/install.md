# CentOS installation
```sh
yum install postgresql-server
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
```

## Install a specific version instead default/suggested/oldOne version
```
# add official repository
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Disable built-in PostgreSQL module:
dnf -q module disable postgresql

# Install PostgreSQL specific version:
yum install postgresql11-server

# Optionally initialize the database and enable automatic start:
sudo /usr/pgsql-11/bin/postgresql-11-setup initdb
sudo systemctl enable postgresql-11
sudo systemctl start postgresql-11
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
