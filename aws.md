# Mounting remote S3 bucket and volume
FUSE with https://github.com/s3fs-fuse/s3fs-fuse<br>
This one rocks, it's pretty slow but works
```
s3fs s3bucketname:/path/to/s3/dir /local/path/directory/mount/ -o passwd_file=${HOME}/.passwd-s3fs -o url="https://S3.URL.WHEN.NOT.AMAZON" -f -o retries=5 -o use_cache=/home/ben/tmp/ -o connect_timeout=600 -o readwrite_timeout=180 -o umask=0007,uid=$UID
```
