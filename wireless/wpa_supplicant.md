# WPA Supplicant (client) configuration
Quick and easy wpa_supplicant setup
```sh
ip a
ip link set <interface> up

# Create basic configuration file
cat <<EOT > /etc/wpa_supplicant/wpa_supplicant-<interface>.conf
ctrl_interface=/run/wpa_supplicant
update_config=1
country=<2_LettersCountryName>
EOT
wpa_passphrase <ESSID> <WPA_PASSPHRASE> >> /etc/wpa_supplicant/wpa_supplicant-<interface>.conf
# Enable the interface and let dhcpcd.service do the rest for you
systemctl enable --now wpa_supplicant@<interface>
```
