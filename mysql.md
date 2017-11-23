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
