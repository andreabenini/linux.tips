# Generate certificate
### Single host
```
certbot --nginx -d host.mydomain.com
```
### wildcard
Generation of a wildcard for nginx, it must include the domain with and without `*.`. You may even use same syntax
reported above but you probably already have an nginx http server in place.
```
certbot certonly --manual --installer nginx -d *.mydomain.com -d mydomain.com
```

# Remove certificate
Delete a certificate from local server, something usually stored in `/etc/letsencrypt/live/`
```
certbot delete --cert-name mydomain.com
```
