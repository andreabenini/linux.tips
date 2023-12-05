# Network Manager
Hate it or love it but NetworkManager is here to stay (on desktops). Here are few common techniques to deal with it.

## Import OpenVPN connections
- older configs usually have **_.ovpn_** extension, `nmcli` imports of these files are pretty straightforward
- newer configs usually have **_.conf_** extension, these files might contain additional data `nmcli` is not capable of importing, few concepts might help you to import them too
- both file types can be imported with minor tricks

### Basic procedure
```sh
# Almost works but special extensions
nmcli connection import type openvpn file myvpnfilename.conf
```

### Extra `<xml/>` tags
**nmcli** usually doesn't handle well extra _\<xml/>_ tags even if are available on newer `.conf` files. 
To use **nmcli** and import configurations you need to comment these lines and provide commented info later from NetworkManager GUI 
(might be Gnome or whatever you prefer later on, even nmcli is fine for it). Here's an example:
```conf
# Original.conf file
...
#Default port 1194 UDP
<connection>
        proto udp
        remote gateway1.company.com
        port 1194
        nobind
</connection>
<connection>
        proto udp
        remote gateway2.company.com
        port 1194
        nobind
</connection>
...
```
```conf
# CHANGE TO THIS (comment extra lines or basically redundant configs, you'll adapt them later on
...
#Default port 1194 UDP
#<connection>
        proto udp
        remote gateway1.company.com
        port 1194
        nobind
#</connection>
#<connection>
#        proto udp
#        remote gateway2.company.com
#        port 1194
#        nobind
#</connection>
...
```
Now import with:
```sh
nmcli connection import type openvpn file myvpnfilename.conf
```
Now, in order to fix the dual gateway connection we've just commented out you need to specify the gateway field, for example:
- #### Gnome Settings / NetworkManager VPN (tab)
    - In the `Gateway` field after the import you should probably see: `gateway1.company.com` which is what we just imported
    - Change the text field `Gateway` to `gateway1.company.com gateway2.company.com`. It's perfectly legit and instructs NetworkManager
      to use a dual gateway configuration when one of them is not reachable


## Make a backup copy of an existing VPN connection
If you have a VPN network connection established with _NetworkManager_ you can easily create a copy of it. All VPN
connections are stored in `/etc/NetworkManager/system-connections` so you can basically get a backup or create a copy:
```sh
cp /etc/NetworkManager/system-connections/myVPN.nmconnection /etc/NetworkManager/system-connections/copyVPN.nmconnection
```
