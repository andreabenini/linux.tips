# Hex commands to remote
How to send binary commands to a remote device
```
echo -n -e "\x0201017N=D1/(hello world)10C\x03" |nc 192.168.0.1 23
```
- -n suppress newlines
- -e echo extended commands (binary,hex,...)
