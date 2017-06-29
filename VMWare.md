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

## Local copy and copy to remote
```
ovftool -ds=datastore1 vi://USERNAME:PASSWORD@The.Host.IP.Address/SERVICE/VMName /tmp/
ovftool -ds=datastore1 --name="VMName" --diskMode=thick --network="VM Network" /tmp/VMName.ovf vi://USER:PASS@IP.ADDRESS/
```

## Issue: "Operation canceled by the user" on copy to remote

- delete the .mf
- Edit the .ovf file and change cdrom device from ISO to ATAPI
- Repeat the copy operation<br/>
Note: Alternatively just edit the source virtual machine and check if there's no cdrom device or nobody is using it

