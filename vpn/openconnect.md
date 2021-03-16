# OpenConnect tips and tricks
## Easy mode
Easy OpenConnect connection:
```sh
sudo sh -c 'echo "mydomainpassword" | openconnect vpnremote.company.corp.com --user=ciscoUser --passwd-on-stdin'
```
Everything belongs to your company, default dns and traffic will be routed there, please apply if you like it.

## Custom commands
Locate your `vpnc-script`, it's installed somewhere in your Linux tree, usually **/usr/share/vpnc-scripts/vpnc-script**
but even **/etc/vpnc/vpnc-script**. This script file will be called and used as your vpn profile on connection. As usual (!?!?!)
Cisco rewrites your local DNS and default route (damn) so sometimes it's better to keep corporate data outside your favorite
settings. That's the reason why you can override it, just pass a new parameter to your vpn settings so it might be a new one like this:
```sh
sudo sh -c 'echo "mydomainpassword" | openconnect vpnremote.company.corp.com --user=ciscoUser -s /home/ben/my.custom.vpn.script --passwd-on-stdin'
```
Now create `my.custom.vpn.script` and chmod it with _(+x)_ executable flag
```sh
#!/bin/bash
# Override corporate forcing of their own DNS, I still prefer mine :)
export INTERNAL_IP4_DNS=
# and execute vpnc-script to make cisco client happy
. /etc/vpnc/vpnc-script
```
Feel free to override other variables as well, take a look at **vpnc-script** to see what it does
