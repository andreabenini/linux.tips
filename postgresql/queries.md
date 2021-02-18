# long queries running
as simple as that:
```sql
SELECT
    pid,
    now() - pg_stat_activity.query_start AS duration,
    query,
    state
FROM
    pg_stat_activity
WHERE
    (now() - pg_stat_activity.query_start) > interval '5 minutes';
```
