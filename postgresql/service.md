# hot reload
Without dealing with system daemon you can actually reload postgresql and restart (without restaring the process) with
```sql
SELECT pg_reload_conf();
```
or:
```sh
pg_ctl reload
```
from your favorite shell

# Check Syntax
```sql
select pg_hba_file_rules();
```
To see if there's something wrong into the `pg_hba.conf` file
