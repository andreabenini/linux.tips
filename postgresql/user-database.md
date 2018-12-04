# Create USER
```sh
CREATE USER <username>;
ALTER USER <username> WITH ENCRYPTED PASSWORD '<HisPassword>';
```

# Create database
```sh
CREATE DATABASE <databasename> WITH OWNER = <username>;
GRANT ALL PRIVILEGES ON DATABASE <databasename> TO <username>;
```
