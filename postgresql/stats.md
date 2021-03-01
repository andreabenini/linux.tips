# Extension `pg_stat_statements`
The **pg_stat_statements** module provides a means for tracking execution statistics of all SQL statements executed by a server.  
The module must be loaded by adding _pg_stat_statements_ to shared_preload_libraries in **postgresql.conf**,
because it requires additional shared memory. This means that a server restart is needed to add or remove the module.

## Init
If your distribution does not include this module it you need to install the package, usually something named `postgresql-contrib`,
difference between various distros might apply:
```sh
# RHEL based
yum install postgresXX-contrib
```

## Loading module
To load this additional module you need to modify **postgresql.conf** file by adding or uncommenting this section
```ini
# postgresql.conf
shared_preload_libraries = 'pg_stat_statements'
```
and you obviously need to restart the service to load the extension on startup

## First shot, create extension
To enable the module and create the virtual view issue this command to the engine:
```sql
CREATE EXTENSION pg_stat_statements;
```
Extension must be enabled on each database you want to control


## Using the extension
as simple as:
```sql
SELECT * FROM pg_stat_statements;
```
To reset internal stats:
```sql
SELECT pg_stat_statements_reset();
```
