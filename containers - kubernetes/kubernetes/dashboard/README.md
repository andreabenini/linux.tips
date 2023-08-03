# Login with the config file
To login with your kubernetes **config** file just add: `token: xxx_Whatever_xxx` to your users section in the `$HOME/.kube/config` file and you're set.
You can get that token from `kubectl -n kubernetes-dashboard get secret...` statement as usual.  
On login prompt use the config file instead of your classic token
```yaml
users:
- name: kubernetes-admin
  user:
    client-certificate-data: <some hash here>
    client-key-data: <some hash there>
    token: xxx_Whatever_xxx
```
