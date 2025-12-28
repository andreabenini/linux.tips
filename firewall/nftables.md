# nftables

# Useful commands
- Configuration
    ```sh
    # iptables --list, kinda.  Useful for listing your config options
    # ...and see effectively if what you wrote in the config is present here too
    nft list ruleset
    ```
- flushing current config
    ```sh
    nft flush ruleset
    ```
- Backup from the default configuration file
    ```sh
    cp /etc/nftables.conf /etc/nftables.conf.backup
    ```
- basic configuration
    ```sh
    # Create a table named 'my_filter'
    nft add table inet my_filter
    
    # Create an 'input' chain to filter incoming packets
    #   default policy to 'drop', meaning any packet that doesn't match a rule will be blocked
    nft add chain inet my_filter input '{ type filter hook input priority 0; policy drop; }'
    
    # Create an 'output' chain for outgoing packets
    #   allow all outgoing traffic, which is common for a server or workstation
    nft add chain inet my_filter output '{ type filter hook output priority 0; policy accept; }'

    # Save current ruleset to the default config file
    sudo nft list ruleset > /etc/nftables.conf
    # Enable the nftables service to start on boot, test it first !
    sudo systemctl enable nftables
    ```
- check configuration
    ```sh
    nft --check --file /etc/nftables.conf
    ```
- apply a configuration
    ```sh
    nft --file /etc/nftables.conf
    ```
- enable service
    ```sh
    systemctl enable --now nftables
    ```
