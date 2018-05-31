# Upgrade or Install modules
CentOS/RHEL are notoriously using old packages to preserve and keep maximum compatibility and stability with well known RPMs,
sometimes this might be a mess, expecially when you need to install additional modules or packages.
That's why you need to use alternative sources outside official RedHat universe, EPEL doesn't come in help with it but
fortunately nginx has its own RPM archive, it's updated and working

### Add nginx repo
Edit `/etc/yum.repos.d/nginx.repo` with your favorite editor and add this content:
```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/rhel/$releasever/$basearch/
gpgcheck=0
enabled=1
```
`yum update nginx` to update the whole stuff
