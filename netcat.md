# Master/Slave basic usage:
On master side
```sh
nc --local-port=1234 --listen --source=127.0.0.1
```
On slave side
```sh
nc localhost 1234
```


# Hex commands to remote
How to send binary commands to a remote device
```
echo -n -e "\x0201017N=D1/(hello world)10C\x03" |nc 192.168.0.1 23
```
- -n suppress newlines
- -e echo extended commands (binary,hex,...)
