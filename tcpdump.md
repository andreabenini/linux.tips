### http debug on destination port
```
tcpdump -vv -n -i eth0 -s 0 -w output.txt src or dst port 80
```
output.txt filename is suitable for tcpdump or wireshark analysis


### Capture only ssl handshake with tcpdump
_(from stack overflow)_
```
tcpdump -ni eth0 "tcp port 443 and (tcp[((tcp[12] & 0xf0) >> 2)] = 0x16)"
```
Now what does it do:

**eth0**: is my network interface, change it if you need

**tcp port 443**: I suppose this is the port your server is listening on, change it if you need

**tcp[((tcp[12] & 0xf0) >> 2)] = 0x16**: a bit more tricky, let's detail this below
tcp[12] means capturing the 13th byte of the tcp packet, corresponding to first half being the offset, second half being reserved. The offset, once multiplied by 4 gives the byte count of the TCP header, meaning ((tcp[12] & 0xf0) >> 2) provides the size of the TCP header.

The first byte of a TLS packet define the content type. The value 22 (0x16 in hexadecimal) has been defined as being "Handshake" content.

As a consequence, tcp[((tcp[12] & 0xf0) >> 2)] = 0x16 captures every packet having the first byte after the TCP header set to 0x16.
