
Docs from [NGINX documentation](http://nginx.org/en/docs/http/configuring_https_servers.html)

```bash
server {
    listen                  80;
    listen                  443 ssl;
    server_name             name.of.your.server.com;
    root                    /var/www/html/;

    ssl_certificate         /etc/nginx/conf.d/cert.crt;
    ssl_certificate_key     /etc/nginx/conf.d/cert.key;
    ssl_protocols           TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers             HIGH:!aNULL:!MD5;
    ...
}
```

Other important options are
```bash
>>>>worker_processes auto;

http {
>>>>    ssl_session_cache   shared:SSL:10m;
>>>>    ssl_session_timeout 10m;

    server {
        listen              443 ssl;
        server_name         www.example.com;
>>>>        keepalive_timeout   70;
```
Use then when needed
