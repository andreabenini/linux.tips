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
#### Example
- Local Traffic: Uses local DNS (e.g., 192.168.1.1).
- Company Traffic (*.company.com): Uses VPN DNS.
- Restricted VPN DNS Scope: Configured the VPN connection to strictly handle only company.com domains
- Adjusted DNS Priorities
  - Local Ethernet/Wi-Fi: Set to High Priority (10)
  - VPN: Set to Lower Priority (50)

## Configuration
Replace "Your_VPN_Name" and "Your_Local_Connection" with your actual connection names or find them
using `nmcli connection show`.
- Configure the VPN (The "Split")  
  Tell the system to use the VPN's DNS only for specific domains (e.g., domain.com and company.com).  
  The `~` prefix is crucial—it signals "routing only" mode. This is NOT what you see in the Gnome
  vpn control panel, you manually need to access it through "_nmcli connection modify_"  
  `nmcli connection modify "Your_VPN_Name" ipv4.dns-search "~domain.com,~company.com"`
- Set DNS Priorities (The "Ranking")  
  Explicitly rank your local connection higher (lower number) than the VPN
  - VPN (Lower Priority)  
    `nmcli connection modify "Your_VPN_Name" ipv4.dns-priority 50 ipv6.dns-priority 50`
  - Local connection (higher priority)  
    ```sh
    # Example: "Wired connection 1" or "Wi-Fi"
    nmcli connection modify "Your_Local_Connection" ipv4.dns-priority 10 ipv6.dns-priority 10
    ```
- Verify  
  Apply the changes (restart connections) and verify:
  ```sh
  # Restart the connection to apply changes
  nmcli connection up "Your_VPN_Name"
  # Check the status
  resolvectl status
  ```
  You should see your local link with the default route and the VPN link serving only the 
  specific search domain.


## Links
- Understanding systemd-resolved, Split DNS, and VPN Configuration.  
  This is the reference I used to properly configure my laptops when VPNs are involved.  
  Best article ever on _systemd-resolved_, really good explaination from basics to advanced, a must read article: https://blogs.gnome.org/mcatanzaro/2020/12/17/understanding-systemd-resolved-split-dns-and-vpn-configuration/
