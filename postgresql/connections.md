# PostgreSQL active connections
```
SELECT * FROM pg_stat_activity;
```

# Kill an active connection to it
`pid` is taken from `pg_stat_activity` field
```
SELECT 
    pg_terminate_backend(pid) 
FROM 
    pg_stat_activity 
WHERE 
    pid <> pg_backend_pid()  AND     -- don't kill my own connection!
    datname = 'database_name'        -- don't kill the connections to other databases
;
```
