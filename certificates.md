Fetch a certificate from remote
```
openssl s_client -connect www.google.com:443 -showcerts
```

Generate certificate information (where *.crt is one of the certificates replied from previous query)
```
openssl x509 -noout -fingerprint -text < google.crt > google.info
```

Generate P12 certificate file from ca,crt,key
```
openssl pkcs12 -export -out newcertificate.p12 -inkey my.key -in my.crt -certfile ca.crt
```
