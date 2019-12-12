# OpenSSL to encrypt messages and files on Linux
## Generate private and public keys
```
# Generate 2K keys, change it to your desired key size
#    - privateKey.pem
#    - publicKey.pem
openssl genrsa -out privateKey.pem 2048
openssl rsa -in privateKey.pem -out publicKey.pem -outform PEM -pubout
```

## Generate a message and encrypt it
```
# Generate message
echo "This is a cool encrypted message" > message
# Encrypt it with a public key
openssl rsautl -encrypt -inkey publicKey.pem -pubin -in message -out message.encrypt
```
now message is encrypted, you can send it to your remote peer

## Decrypt message
```
openssl rsautl -decrypt -inkey privateKey.pem -in message.encrypt -out newmessage
cat newmessage
#> This is a cool encrypted message
```

that's it.
