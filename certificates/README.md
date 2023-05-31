# common operations
## view SSL certificate (PEM file)
```sh
openssl x509 -in certificate.pem -noout -text
```

## Fetch a certificate from remote
```sh
openssl s_client -connect www.google.com:443 -showcerts

# A more compact form to fetch info and store in a certfile
echo "" | openssl s_client -connect www.google.com:443 -showcerts 2>/dev/null | openssl x509 -out certfile.txt
```
## Generate certificate information
where *.crt is one of the certificates replied from previous query
```sh
openssl x509 -noout -fingerprint -text < google.crt > google.info
```
## Generate P12 certificate file from ca,crt,key
```sh
openssl pkcs12 -export -out newcertificate.p12 -inkey my.key -in my.crt -certfile ca.crt
```
## Generate PEM certificate file from pfx/p12 (and remove password from it)
Useful for apple push notification certs (PEM), it creates a `.pem` file without password in the `.p12` file, if any.<br>
Used for generating push notification server side file
```sh
openssl pkcs12 -in aps_development.p12 -out aps_development.pem -nodes
```
## From CER to PEM (der format)
To convert from .CER to .PEM you can use this one:
```sh
openssl x509 -inform der -in certificate.cer -out certificate.pem
```

# keytool
## View the contents of a .pem certificate

```sh
keytool -printcert -file certificate.pem
```


# External links:
- Build a Tiny Certificate Authority For Your Homelab  
    https://smallstep.com/blog/build-a-tiny-ca-with-raspberry-pi-yubikey/  
