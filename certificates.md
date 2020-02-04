# Fetch a certificate from remote
```
openssl s_client -connect www.google.com:443 -showcerts
```

# Generate certificate information
where *.crt is one of the certificates replied from previous query
```
openssl x509 -noout -fingerprint -text < google.crt > google.info
```

# Generate P12 certificate file from ca,crt,key
```
openssl pkcs12 -export -out newcertificate.p12 -inkey my.key -in my.crt -certfile ca.crt
```

# Generate PEM certificate file from pfx/p12 (and remove password from it)
Useful for apple push notification certs (PEM), it creates a `.pem` file without password in the `.p12` file, if any
```
openssl pkcs12 -in aps_development.p12 -out aps_development.pem -nodes
```
