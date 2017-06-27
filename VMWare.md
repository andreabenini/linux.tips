### Virtual machines import/export
```
# Export remote virtual machine to local /tmp/ .OVA file (kinda cool uh ?)
ovftool -tt=ova -ds=datastore1 vi://root:<MY OWN PASSWORD ON ESX>@<REMOTE ESX ADDRESS>/<MACHINE NAME>  /tmp/
```
