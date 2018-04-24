# How To Deal With A DDoS Attack
_full credits to [this link](https://serversuit.com/community/technical-tips/view/how-to-deal-with-a-ddos-attack.html)_

You got a irregularly high amount of traffic coming into your server.
So much, in fact, that it's slowing down your server and other clients are timing out trying to access it. 
Looks like you're under a DDoS attack. DDoS, or destributed denial of service, 
is a specific way to attack and distabilize a server, by flooding it with traffic from one or more sources.

On a Linux server, you can identify the multiple connections flooding your server using the netstat utility.
```
$ netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head -3
```
There are generally two kinds of DDoS attacks. The first kind floods your inbound network connection,
which interferece with valid clients trying to connect. The other kind is when the attacks targets a specific service, 
like your email server, which eventually either stalls from increased server load, 
or starts rejecting all incoming requests completely. 

Usually, DDoS attack are deployed through botnets - a large amount of independent computers and servers
that have been compromised and made to operate together to flood target networks. 

When you're under an attack like this, it's difficult _if not impossible_ to connect to your server remotely. 
Instead, use reserve connections such as IPMI/KVM. 
You can analyze the traffic and where it's coming from using **tshark**, **tcpdump**, or **iftop**.

Most hosting providers usually just add the infected servers to a "blackhole" where they just drop all incoming packets, 
while insiting that you add DDoS protection services such as CloudFlare, Akamai or something comparable. 
It's a good idea to have these services ready ahead of time, 
as well as contacting your hosting provider to discuss DDoS protection. 

A common preventative tactic, is to use proxy or CDN servers to hide your actual IP address from the public. 
You can configure your server to accept requests to your IP address only from other trusted addresses, 
having the rest of your traffic going through the proxies. 
This serves a dual purpose of also protecting you against threats that try to circumvent your proxy.

You can use utilities like Uptime, W, or PS to check for cases when it's just a single process that's being targeted. 

Checking log files is a good move, as they could often contain traces of the servers the attacks are coming from, 
their subnets, and User-Agents used to make requests to these servers. 
Though, it's important to use separate utilities to parce the log files, such as Head, Tail, Grep or Less, 
since opening an entire log file at once can further stall your already system. 

For instance, if you have a Nginx based web server that's recieving a large amount of requests with the string WordPress 
appearing within the user-agent, you can block all of these requests with just one line of script
```
if ($http_user_agent ~ WordPress) { return 444; }
```
You can do the same using iptables, ipset or Fail2ban
```
# iptables -A INPUT -p tcp --dport 80 -m string --algo bm --string "WordPress" -j DROP
```
For users that are less experienced using tools like IPTables, this might be a bit complex. 
If you're running a Nginx server, you can use the **ngx_http_limit_req_module** module (awesome name) 
that will allow you to restrict the amount of requests per second your server will handle from specific IP addresses. 

Attacks like this can also exploit vulnerabilities that can arise when software is configured improperly, 
for instance when it comes to things like DNS and NTP amplification. 

Reinstalling and reconfiguring said software would be very pertinent in that case, 
making sure to get the latest patches and being extra careful during the course of setup. 
In some cases, vulnerabilities arise when software and services go out of use, but continue to run;
allowing extraneous access paths to your system. 
Always remembering to stop and remove unused software and services is just as important to prevent and stop attacks.
