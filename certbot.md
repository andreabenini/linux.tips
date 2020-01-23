# Generate wildcard with certbot
Generation of a wildcard for nginx, it must include the domain with and without `*.`
```
certbot certonly --manual --installer nginx -d *.mydomain.com -d mydomain.com
```
