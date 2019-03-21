# Mismatch or incompatible versions
nginx modules must have same version of the engine itself, do not mix them or you'll probably get errors like this one
```
module "/usr/lib64/nginx/modules/ngx_http_geoip_module.so" version 1012002 instead of 1014002 in /usr/share/nginx/modules/mod-http-geoip.conf
```
To solve get a rid of old 1.12 modules and install them from nginx official repo with the latest nginx engine as stated here:
https://translate.google.com/translate?hl=en&sl=zh-CN&u=https://blog.csdn.net/jiangzeyin_/article/details/80397009&prev=search
(this guy got the spot and wisely chosen to install same versions)
