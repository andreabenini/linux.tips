# Show multiple connections on your server with netstat utility
```
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head -3
```
