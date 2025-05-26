# Master/Client basic usage:
### On master side
```sh
nc --local-port=1234 --listen --source=127.0.0.1
# to immediately flush the buffer in order to see results just use stdbuf like:
stdbuf -o0 nc -l -p 1234 --verbose
```

### On client side
Line buffering (default)
```sh
nc localhost 1234
telnet localhost 1234
```

Character mode
```sh
# Disable line buffering with telnet  [[ MANUALLY ]]
telnet localhost 1234
# Toggle command mode -> Ctrl+]
# Toggle from line mode to character mode
telnet> mode character
# Transform <return> to \x13\x10 instead of just \x13
telnet> set crlf

# Disable line buffering with telnet  [[ AUTOMATICALLY ]]
# `expect` command utility is required
expect -c '
    spawn telnet YOUR_SERVER_IP YOUR_PORT
    expect "Escape character is"
    send "\x1d" 
    expect "telnet>"
    send "mode character\r"
    send "\r"
    interact
'
```


# Hex commands to remote
How to send binary commands to a remote device
```
echo -n -e "\x0201017N=D1/(hello world)10C\x03" |nc 192.168.0.1 23
```
- -n suppress newlines
- -e echo extended commands (binary,hex,...)
