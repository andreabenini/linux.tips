# SSL Fixes _(on older iRobots devices)_
- Edit Home Assistant container SSL configuration file to ignore unsafe legacy negotiations protocols
- Test it by restarting HA Core only (through Web UI)
- If everything works copy the modified file locally
- Add a parameter on .service container file to mount the newly copied file during startup each time
- Restart Home Assistant container to test it out


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
