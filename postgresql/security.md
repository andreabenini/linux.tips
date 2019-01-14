# Listen on ALL interfaces
It's not a good idea but quite useful when developing on a test machine
#### postgresql.conf
```
# Change it to '*'
listen_addresses = '*' 	       	       	# Listen on all	interfaces, default is 'localhost'
```

#### pg_hba.conf
```
# Add this line
host    all             all             0.0.0.0/0               md5
```


# Listen on localhost only
Better for production machines
#### pg_hba.conf
This is what it's needed, no other lines required
```
host    all             all             127.0.0.1/32            md5
```
