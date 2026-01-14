# SSL fixes
```sh
podman exec -u 0 homeassistant sed -i 's/providers = provider_sect/providers = provider_sect\nssl_conf = ssl_sect\n\n[ssl_sect]\nsystem_default = system_default_sect\n\n[system_default_sect]\nOptions = UnsafeLegacyRenegotiation/' /etc/ssl/openssl.cnf
podman cp home-assistant:/etc/ssl/openssl.cnf ./openssl_custom.cnf
```

```sh
# don't restart the container, restart the core only

# then...
-v /path/to/your/openssl_custom.cnf:/etc/ssl/openssl.cnf:ro
```


ip address, not the name
