## Asymmetric encryption

For Asymmetric encryption you must first generate your private key and extract the public key.
```
openssl genrsa -aes256 -out private.key 8912
openssl rsa -in private.key -pubout -out public.key
```

To encrypt:
```
openssl rsautl -encrypt -pubin -inkey public.key -in plaintext.txt -out encrypted.txt
```
To decrypt:
```
openssl rsautl -decrypt -inkey private.key -in encrypted.txt -out plaintext.txt
```

## Encripting files
You can't directly encrypt a large file using `rsautl`. Instead, do the following:
- Generate a key using `openssl rand`, e.g. `openssl rand 32 -out keyfile`.
- Encrypt the key file using `openssl rsautl`.
- Encrypt the data using `openssl enc`, using the generated key from step 1.
- Package the encrypted key file with the encrypted data. The recipient will need to decrypt the key with their private key, then decrypt the data with the resulting key.

Ultimate solution for safe and high secured encode anyone file in OpenSSL and command-line:

Private key generation (encrypted private key):
```
openssl genrsa -aes256 -out private.pem 8912
openssl rsa -in private.pem -pubout -out public.pem
```
With unecrypted private key:
```
openssl req -x509 -nodes -days 100000 -newkey rsa:8912 -keyout private_key.pem -out certificate.pem
```
With encrypted private key:
```
openssl req -x509 -days 100000 -newkey rsa:8912 -keyout private_key.pem -out certificate.pem
```
With existing encrypted (unecrypted) private key:
```
openssl req -x509 -new -days 100000 -key private_key.pem -out certificate.pem
```

### Encrypt a file

Encrypt binary file:
```
openssl smime -encrypt -binary -aes-256-cbc -in plainfile.zip -out encrypted.zip.enc -outform DER yourSslCertificate.pem
```
Encrypt text file:
```
openssl smime -encrypt -aes-256-cbc -in input.txt -out output.txt -outform DER yourSslCertificate.pem
```

What is what:
- `smime` — ssl command for S/MIME utility (smime(1)).
- `-encrypt` — chosen method for file process.
- `-binary` — use safe file process. Normally the input message is converted to "canonical" format as required by the S/MIME specification, this switch disable it. It is necessary for all binary files (like a images, sounds, ZIP archives).
- `-aes-256-cbc` — chosen cipher AES in 256 bit for encryption (strong). If not specified 40 bit RC2 is used (very weak). (Supported ciphers).
- `-in plainfile.zip` — input file name.
- `-out encrypted.zip.enc` — output file name.
- `-outform DER` — encode output file as binary. If is not specified, file is encoded by base64 and file size will be increased by 30%.
- `yourSslCertificate.pem` — file name of your certificate's. That should be in PEM format.

That command can very effectively a strongly encrypt any file regardless of its size or format.

### Decrypt a file
Decrypt binary file:
```
openssl smime -decrypt -binary -in encrypted.zip.enc -inform DER -out decrypted.zip -inkey private.key -passin pass:your_password
```

For text files:
```
openssl smime -decrypt -in encrypted_input.txt -inform DER -out decrypted_input.zip -inkey private.key -passin pass:your_password
```
What is what:

- `-inform DER` — same as `-outform` above.
- `-inkey private.key` — file name of your private key. That should be in PEM format and can be encrypted by password.
- `-passin pass:your_password` — (optional) your password for private key encrypt.

## Verification

Creating a signed digest of a file:
```
openssl dgst -sha512 -sign private_key.pem -out digest.sha512 file.txt
```
Verify a signed digest:
```
openssl dgst -sha512 -verify public_key.pem -signature digest.sha512 file.txt
```

_credit (https://gist.github.com/dreikanter/c7e85598664901afae03fedff308736b)_
