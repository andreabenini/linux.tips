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

-- Table structure
\d pg_stat_statements;
           View "public.pg_stat_statements"
       Column        |       Type       | Modifiers
---------------------+------------------+--------------
 userid              | oid              | 
 dbid                | oid              | 
 queryid             | bigint           | 
 query               | text             | 
 calls               | bigint           | 
 total_time          | double precision | 
 min_time            | double precision | 
 max_time            | double precision | 
 mean_time           | double precision | 
 stddev_time         | double precision | 
 rows                | bigint           | 
 shared_blks_hit     | bigint           | 
 shared_blks_read    | bigint           | 
 shared_blks_dirtied | bigint           | 
 shared_blks_written | bigint           | 
 local_blks_hit      | bigint           | 
 local_blks_read     | bigint           | 
 local_blks_dirtied  | bigint           | 
 local_blks_written  | bigint           | 
 temp_blks_read      | bigint           | 
 temp_blks_written   | bigint           | 
 blk_read_time       | double precision | 
 blk_write_time      | double precision | 
```
To reset internal stats:
```sql
SELECT pg_stat_statements_reset();
```
