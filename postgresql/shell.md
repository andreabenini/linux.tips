# Shell commands when dealing with PostgreSQL
one shot command, no pager at all
```sh
psql --user=username --dbname="databasename" --host=127.0.0.1 --pset=pager=off --command "SELECT * FROM mysupercooltable"
```
