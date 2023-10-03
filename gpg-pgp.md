# Command line examples for GPG/PGP
Practical examples for dealing with GPG keys

```sh
# Generate a PGP key
gpg --gen-key

# Listing locally available keys
# Your favorite 8 char KeyID is: "pub RSAxxxx/<8CHAR_KEY>" from output
gpg --list-key --keyid-format SHORT
gpg --list-key --keyid-format LONG

# Search for a PGP key
gpg --keyserver pgp.mit.edu --search-keys <8CHAR_KEY>

# Send a key to MIT servers
gpg --send-keys --keyserver pgp.mit.edu <8CHAR_KEY>

# Receiving and storing a key from MIT servers
gpg --keyserver pgp.mit.edu --recv-keys <8CHAR_KEY>

# Removing keys/subkeys
gpg --delete-key <16CHAR_KEYID>
# Deleting internal secret key before deleting KEYID
gpg --delete-secret-key <16CHAR_KEYID>
```
