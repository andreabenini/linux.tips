# TCP TIME_WAIT and recycle connections
How to reduce, recycle, reuse TCP incoming connections from TIME_WAIT state
##### temporary: command line test, at runtime
```sh
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout   # FIN TIME_WAIT    (def:60)
echo 1  > /proc/sys/net/ipv4/tcp_tw_recycle    # Enable recycling (def: 0)
echo 1  > /proc/sys/net/ipv4/tcp_tw_reuse      # Enable TCP reuse (def: 0)
```
##### permanent: /etc/sysctl.conf or /etc/sysctl.d/(your.own.file)
```sh
# Decrease TIME_WAIT seconds
net.ipv4.tcp_fin_timeout = 30

# Recycle and Reuse TIME_WAIT sockets faster
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1
```

# Links
- [Building Scalable Real-Time Internet Technology](https://mrotaru.wordpress.com/2013/10/10/scaling-to-12-million-concurrent-connections-how-migratorydata-did-it/)
    Use case on how to scale up to 12 Million Concurrent Connections with a single 1U server
