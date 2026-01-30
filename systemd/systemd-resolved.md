# VPN split DNS setup
## Overview
It's quite common to have a dns when the computer is part of a LAN, it's also common to have a
local domain with local resources accessible only from the lan itself. When a new VPN connection comes
around it's also common to route or use remotely provided resolvers by overwriting local and legit ones.
While this can be understandable in most of the cases it's not usually the only scenario
and almost not tolerated in a crowded homelab.  

Usually a VPN connection is an add-on and newer resources and networks should not interfere with a working
setup. Considering how `/etc/resolv.conf` works it's almost impossible to always find a solution to it
unless you're using NetworkManager.
NetworkManager has an (odd) solution to the problem with `systemd-resolved` but it almost works flawlessly.

If you want to tinker with `systemd-resolved` and you want to control everything from fancy widgets
(gnome, kde) you're in the wrong place. These settings are applied directly to NetworkManager, they won't
be updated nor overwritten by your friendly network connection applet and are now considered the default way for solving these problems.


## Links
- Understanding systemd-resolved, Split DNS, and VPN Configuration.  
  This is the reference I used to properly configure my laptops when VPNs are involved.  
  Best article ever on _systemd-resolved_, really good explaination from basics to advanced, a must read article: https://blogs.gnome.org/mcatanzaro/2020/12/17/understanding-systemd-resolved-split-dns-and-vpn-configuration/
