# Docker & Proxies
A corporate proxy might be a big problem if you need to deal with docker & dockerHub. 
That's the reason why you need to edit the docker service, use _$HTTP_PROXY/$http_proxy_ 
vars as a workaround but if you're not able to `docker pull image/whatever` you may probably
know service file needs to be altered. And here's:
```sh
# Create when necessary
mkdir -p /etc/systemd/system/docker.service.d/

# Add these information or edit your existing file accordingly
cat >> /etc/systemd/system/docker.service.d/http-proxy.conf <<EOF
[Service]
Environment="HTTP_PROXY=http://user:password@host:port/"
Environment="HTTPS_PROXY=http://user:password@host:port/"
Environment="NO_PROXY=localhost,127.0.0.0/8,192.168.1.0/24,192.168.49.0/24"
EOF

# Reload & restart
sudo systemctl daemon-reload
sudo systemctl restart docker
```

