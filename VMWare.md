# Command line tips when dealing with Virtual Machines

### Virtual machines import/export
```
# Export remote virtual machine to local /tmp/ .OVA file (kinda cool uh ?)
ovftool -tt=ova -ds=datastore1 vi://root:<MY OWN PASSWORD ON ESX>@<REMOTE ESX ADDRESS>/<MACHINE NAME>  /tmp/
```

### Remote/Remote Virtual Machine Copy
```
# Do not even use local storage, copy directly from one ESX host to another
ovftool -ds=datastore1 vi://myusername:mypassword@192.168.0.2/SERVICE/VMName vi://user2:pass2@192.168.0.3/
```
