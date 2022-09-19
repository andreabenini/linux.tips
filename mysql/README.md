### Process List
In this case it gets database connections from external processes
> mysql --user=Username --password=UserPassword -e "show processlist;"

### Connections and Status
    ~$ mysql --user=Username --password=UserPassword -e "show status;" |grep -i conn
or

    mysql> show status like 'Conn%';
as well as:

    ~$ mysqladmin status
    Uptime: 4661  Threads: 1  Questions: 200  Slow queries: 0  Opens: 16  Flush
    tables: 1  Open tables: 6  Queries per second avg: 0.043

Show hostnames, users and threads currently opened
```sql
    SELECT
        SUBSTRING_INDEX(host, ':', 1) AS host_short,
        GROUP_CONCAT(DISTINCT user) AS users,
        COUNT(*) AS threads
    FROM
        information_schema.processlist
    GROUP BY
        host_short
    ORDER BY
        COUNT(*), host_short;
```


### Records from all tables in a database
```sql
SHOW databases;
SELECT TABLE_NAME, TABLE_ROWS FROM information_schema.tables  WHERE table_schema = 'NameOfYourDatabase';
```

### Detect table type
inno, myisam and so on
```sql
SHOW TABLE STATUS WHERE Name='YourTableName';
```

### Sort tables by disk space
Useful when you need to optimize tables or understand who is wasting disk space
```sql
SELECT
    TABLE_NAME AS `Table`,
    ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024) AS `Size (MB)`
FROM
    information_schema.TABLES
WHERE
    TABLE_SCHEMA = "DatabaseName"
ORDER BY
    (DATA_LENGTH + INDEX_LENGTH) DESC;
```

### List databases size on disk
```sql
SELECT table_schema 'DB Name',
    round( sum(data_length + index_length) / 1024 / 1024 / 1024, 2)   AS "DB Size [Gb]",
    round( sum(data_free) / 1024 / 1024 / 1024, 2)  AS "Free Space [Gb]"
FROM information_schema.TABLES
GROUP BY table_schema; 
```

### Use pager on SELECT results
A pager is somewhat handy when you need to parse or evaluate a massive amount of output from stdout
```sql
-- set pager to less
pager less

-- restore pager to factory defaults
pager
```
