# Database dump
```
pg_dump --username=<username> --password --host=127.0.0.1 <databaseName>  >  database.dump

# Additional option:  --format=tar
#                     Formats: plain, custom, directory, tar
```

# Database restore
```
pg_restore --dbname=<database> --user=<username> --host=127.0.0.1 database.dump
```
