# NFS Server Installation, quick HOWTO
- install `nfs-utils` package (client and daemon package files)
- edit `/etc/exports` file accordingly
```sh
# sample shares
/mnt/share      host1(rw,sync,fsid=0,insecure,no_subtree_check) \
                host2(rw,sync,all_squash,anonuid=1000,anongid=1000,fsid=0,insecure,no_subtree_check) \
                host3(rw,sync,insecure,no_subtree_check,all_squash,anonuid=501,anongid=501)
/projects       proj*.local.domain(rw)
/usr            *.local.domain(ro) @trusted(rw)
/home/ben       pc001(rw,all_squash,anonuid=150,anongid=100)
/pub            *(ro,insecure,all_squash)
/srv/www        -sync,rw server @trusted @external(ro)
/foo            2001:db8:9:e54::/64(rw) 192.0.2.0/24(rw)
/build          buildhost[0-9].local.domain(rw)
```
- edit `/etc/nfs.conf` to specify which IPs and/or hostnames to listen on
```sh
host=192.168.1.222
# hostname as alternative
host=nfsservername
```
More info from https://wiki.archlinux.org/title/NFS


# Limit on specific interfaces only
- **rpcbind**, edit the service file (`systemctl edit --full rpcbind`)  
  Add to **ExecStart** attribute a string with all your required interfaces:  
  > `ExecStart=/usr/bin/rpcbind ... -h 127.0.0.1 -h 192.168.1.1`
- Restrict nfs server on `/etc/nfs.conf`  
  In the **[nfsd]** section explicitly define all your IP addresses
  ```conf
  [nfsd]  
  #...
  host=192.168.1.1
  ```
- **nfs-mountd** has no restrictions and blindly always listen on 0.0.0.0.
  Switch to nfsv4 and use a firewall to avoid it as much as you can


# Useful links
- HowTo speedup NFS volume<br>
  http://nfs.sourceforge.net/nfs-howto/ar01s05.html
