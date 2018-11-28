# TCP TIME_WAIT and recycle connections
How to reduce, recycle, reuse TCP incoming connections from TIME_WAIT state
```sh
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout   # FIN timeout, default: 30
echo 1  > /proc/sys/net/ipv4/tcp_tw_recycle    # Enable recycling (def: 0)
echo 1  > /proc/sys/net/ipv4/tcp_tw_reuse      # Enable TCP reuse (def: 0)
```


# Links
- [Building Scalable Real-Time Internet Technology](https://mrotaru.wordpress.com/2013/10/10/scaling-to-12-million-concurrent-connections-how-migratorydata-did-it/)
    Use case on how to scale up to 12 Million Concurrent Connections with a single 1U server
