# SSL Fixes _(on older iRobot devices)_
- Edit Home Assistant container SSL configuration file to ignore unsafe legacy negotiations protocols
- Test it by restarting HA Core only (through Web UI)
- If everything works copy the modified file locally
- Add a parameter on .service container file to mount the newly copied file during startup each time
- Restart Home Assistant container to test it out

## Steps definitions
```sh
# Fix HA /etc/ssl/openssl.cnf file to ignore older (and now considered) unsafe protocols
#    - container name: 'homeassistant'
#    - sed expression here reported just works, feel free to add other older protocold if needed
podman exec -u 0 homeassistant sed -i 's/providers = provider_sect/providers = provider_sect\nssl_conf = ssl_sect\n\n[ssl_sect]\nsystem_default = system_default_sect\n\n[system_default_sect]\nOptions = UnsafeLegacyRenegotiation/' /etc/ssl/openssl.cnf

# Restart HA Core with one of these methods:
# - Using Web UI (Developer Tools / Check and restart / Restart)
# - Enter the container, restart python HA venv manually (or kill it and restart again)

# Copy modified ssl configuration locally on base host
podman cp home-assistant:/etc/ssl/openssl.cnf ./openssl_custom.cnf

# Add ssl mounting option to HA Container command (podman/docker) to manually mount the new openssl.cnf
# - Adjust local path accordingly
# - Keep remote path untouched (/etc/ssl/openssl.cnf)
# - ReadOnly (ro) is more than enough
-v /path/to/your/openssl_custom.cnf:/etc/ssl/openssl.cnf:ro

# Restart the container to finally test it
systemctl --user restart homeassistant
```


# other
ip address, not the name
