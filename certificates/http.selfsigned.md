# Generate self signed certificate
Common Name (CN) must match with http server name or alias
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out selfsigned.crt
```
Generated files: _private.key_, _privkey.pem_, _selfsigned.crt_.  
These are rightfully *NOT* trusted because are generated from an unknown source CA (your host)

---

#### _apache.site.conf_, domain virtual host configuration
```
    SSLCertificateFile          /etc/httpd/ssl/selfsigned.crt
    SSLCertificateKeyFile       /etc/httpd/ssl/private.key
```
