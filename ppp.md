# Setup
```sh
# [ppp] package has to be installed, just check it and install if needed
pacman -Ss ppp

# if you need PPPoE just be sure to have [rp-pppoe] too,
# [pppudsage] is optional and handy if you want to monitor pppd connections
pacman -Ss rp-pppoe
```


# PPPoE configuration and connection
- Edit `/etc/ppp/peers/connectionName` file and applt your changes there, here's
    a sample configuration file
    - change `<PROVIDER>`, `<PROVIDER_DESCRIPTION>`, `<USERNAME>` accordingly
    - connection file name might be whatever you prefer, just remember it if you'd like
    to later use `pppd call connectionName` or `pon connectionName` later on
    ```conf
    plugin pppoe.so
    pppoe-ac "<PROVIDER>"
    pppoe-service "<PROVIDER_DESCRIPTION>"

    # network interface
    wan

    # login name
    name "<USERNAME>"

    # Use or avoid remotely supplied dns. avoid it if you're running a local caching dns server
    # usepeerdns

    persist

    # Uncomment this if you want to enable dial on demand
    #demand
    #idle 180

    defaultroute
    hide-password
    noauth
    ```
- By default the configuration in `/etc/ppp/peers/provider` is treated as the default,
    if you want to make _"connectionName"_ the default, you can create a link like or rename it
    to `provider`
    ```sh
    # Both are fine
    ln -s /etc/ppp/peers/connectionName /etc/ppp/peers/provider
    mv /etc/ppp/peers/connectionName /etc/ppp/peers/provider
    ```
- Add password in _PAP_ and _CHAP_ secret files: `/etc/ppp/pap-secrets`, `/etc/ppp/chap-secrets`.
    Usually chap is preferred but let the daemon choose between them so change both files with
    your valid configurations. Something like: `YourUserName * YourPassword`. Permission has to
    be set to **600** on both
    ```conf
    YourUserName * YourPassword
    ```
- To start and test connection you can use one of these methods:
    ```sh
    pon connectionName
    pon             # 'provider' is selected
    pppd call connectionName

    # To close these connections just:
    poff connectionName
    poff
    ...
    ```

# Service management
- To start the connection on boot:
    ```sh
    systemctl enable ppp@connectionName.service
    # Change it to your connection name accordingly
    ```
