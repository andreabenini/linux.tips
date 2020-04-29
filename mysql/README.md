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

### Records from all tables in a database
```
SHOW databases;
SELECT TABLE_NAME, TABLE_ROWS FROM information_schema.tables  WHERE table_schema = 'NameOfYourDatabase';
```

### Detect table type
inno, myisam and so on
```
SHOW TABLE STATUS WHERE Name='YourTableName';
```

### Sort tables by disk space
Useful when you need to optimize tables or understand who is wasting disk space
```
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
