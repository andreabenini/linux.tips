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

# Generate self signed certificate (WITH CA)
This is a little bit more complex because a self created CA is required but it won't take so much.
#### Generate a Certificate Autority (CA)
```
openssl genrsa -des3 -out ben.CA.key 2048
```
and enter a _password_ for accessing the CA
#### Generate a root certificate for the CA (ROOT CERTIFICATE)
```
openssl req -x509 -new -nodes -key ben.CA.key -sha256 -days 1825 -out ben.CA.pem
```
Insert the CA password and complete the x509 certificate information (when needed), insert real data and real host name.  
  
##### Client Side:
```
# Adding CA to clients
## MacOS (cli)
security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" ben.CA.pem
```

#### Create CA-Signed certificate  
Create private key (.key)
```
openssl genrsa -out dev.ben.org.key 2048
```
#### Create Certificate (.csr)
Create complete CSR file, complete the form with site information where required
```
# dev.ben.org.csr will be created
openssl req -new -key dev.ben.org.key -out dev.ben.org.csr
```

#### Configuration file
Now create the certificate using .CSR, CA private key, CA certificate, and a config file.  
The config file is something like:
[config.ext]
```
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = dns.ben.org
```
Where the DNS is obviously the trusted dns for that cert.

#### Final touch
Now finally with all these files you can create a signed .crt file with something like this:
```
openssl x509 -req -in dev.ben.org.csr -CA ben.CA.pem -CAkey ben.CA.key -CAcreateserial -out dev.ben.org.crt -days 825 -sha256 -extfile config.ext
```
Enter the CA password and you'ré set.  

So, to recap there're these files:
- dev.ben.org.key (private key)
- dev.ben.org.csr (certificate signing request)
- dev.ben.org.crt (signed certificate)

HTTPD server must use:
- server private key
- signed certificate

So edit the httpd .conf file as suggested in the section above
