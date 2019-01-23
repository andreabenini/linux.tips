Detect CD/DVD information before copy
```sh
~ # isoinfo -d -i /dev/cdrom | grep -i -E 'block size|volume size'
Setting input-charset to 'UTF-8' from locale.
Logical block size is: `2048`
Volume size is: `74500`
```
In this example `blocksize` and `volume size` are the numbers we're looking for<br>
Now copy the image to disk
```sh
dd if=/dev/cdrom of=/tmp/test.iso bs=2048 count=74500
```

This is might be mounted directly or burned with your favorite tool (cdrtools, brasero, k3b, ...)
