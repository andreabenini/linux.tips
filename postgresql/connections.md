# PostgreSQL active connections
```sql
SELECT * FROM pg_stat_activity;
```
or oneliner from command shell:
```sh
psql --command="SELECT * FROM pg_stat_activity;" --pset pager=off
```

# Kill an active connection to it
`pid` is taken from `pg_stat_activity` field
```sql
SELECT 
    pg_terminate_backend(pid) 
FROM 
    pg_stat_activity 
WHERE 
    pid <> pg_backend_pid()  AND     -- don't kill my own connection!
    datname = 'database_name'        -- don't kill the connections to other databases
;
```
