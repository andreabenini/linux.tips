# Installation
- Basic software requirements: podman
    ```sh
     # Software requirements
     pacman -Syu podman
    ```
- Create user and enable it in a podman rootless mode
    ```sh
     # Environment and user setup
     useradd -d /home/homeassistant -m homeassistant
     loginctl enable-linger homeassistant

     grep homeassistant /etc/subuid /etc/subgid
     #/etc/subuid:homeassistant:165536:65536
     #/etc/subgid:homeassistant:165536:65536
    ```
- Login and work as `homeassistant` user
    ```sh
     # Do not use 'su' or 'sudo su - homeassistant', use 'machinectl'
     machinectl shell homeassistant@
    ```
- Create basic configuration and test the first startup
    ```sh
     # Create a configuration directory and start the container
     mkdir -p ~/hass_config
     podman run -d \
        --name homeassistant \
        --label "io.containers.autoupdate=registry" \
        -v ~/hass_config:/config \
        -e TZ="Europe/Rome" \
        -p 8123:8123 \
        ghcr.io/home-assistant/home-assistant:stable
     # Detect if it's running once created
     podman ps
    ```
- Test it by visiting: http://YOUR.HOST.IP.ADDRESS:8123/
- Make it start automatically at boot
    ```sh
     # Configuration directory
     mkdir -p ~/.config/systemd/user
     # Generate the service file for it
     podman generate systemd --new --name homeassistant > ~/.config/systemd/user/homeassistant.service
     # Remove newly created container, systemd will take care of it from now on
     podman rm -f homeassistant
     # Enable and start the --user systemd service
     systemctl --user daemon-reload
     systemctl --user enable --now homeassistant
     systemctl --user status homeassistant
    ```
