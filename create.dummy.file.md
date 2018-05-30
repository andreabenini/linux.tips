# How to create a big file
dd is fine, but slow
```
dd if=/dev/zero of=bigfile.img bs=10G count=1024
```
fallocate is even better (when available)

```
fallocate -l 10G bigfile.img
```

or with more exoteric bashing scripts...
```
yes "Some text" | head -n 100000 > large-file
repeat 10000 echo some test > large-file
{repeat 10000 echo some test} > large-file
seq 100000 > large-file
truncate -s 10G large-file
```
