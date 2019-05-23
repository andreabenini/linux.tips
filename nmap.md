
# Links
[Scan a Large Network for a Certain Open TCP Port](https://nmap.org/book/solution-find-open-port.html)

# Examples
```
# Scan TCP port 80 in that network, pay attention to timeout, they should be adjusted for different network and latencies
nmap -T4 -Pn -p80 --max-rtt-timeout 200ms --initial-rtt-timeout 150ms --min-hostgroup 512 -oG /dev/stdout 172.25.4.0/24
```
