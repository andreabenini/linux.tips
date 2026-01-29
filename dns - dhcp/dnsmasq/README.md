# dnsmasq configuration and tips

## dnsmasq cannot be started or has been delayed
When dealing with network.pre-target services (usually firewall daemons like nftables, iptables, ...)
it might happen that the network layer is up, the network target has been reached but the defined IP
address where dnsmasq has to be tied is not ready yet.  
dnsmasq is usually being started with the `--bind-interfaces` flag which is hardcoded in its systemd
service file. This flag forces dnsmasq to fail if the network interface isn't fully ready at startup,
creating a race condition. 

The most robust solution, which avoids _"whack-a-mole"_ dependency management, is to switch dnsmasq
to "dynamic binding" mode. This allows it to start immediately and listen on the interface as soon as
it appears.

**It can be solved by:**
- Creating a systemd override file to remove problematic `--bind-interfaces` flag from the dnsmasq service.
    ```sh
    # /etc/systemd/system/dnsmasq.service.d/override.conf 
    [Service]
    ExecStart=
    ExecStart=/usr/bin/dnsmasq -k --enable-dbus --user=dnsmasq --group=dnsmasq --pid-file
    ```
- Adding a new configuration file to enable **bind-dynamic**, ensuring dnsmasq handles network changes
    gracefully while maintaining security.
    ```sh
    # /etc/dnsmasq.d/dynamic-bind.conf
    bind-dynamic
    ```
- Restart dnsmasq to apply the changes.

This approach fixes the root configuration issue and ensures reliable startups for dnsmasq without requiring complex boot order dependencies.  
Most other services (like sshd) don't suffer from this because they don't enforce such
strict interface binding by default (even if they might need to wait for interfaces to be ready, see:
[delays from pre target services](/systemd/networkd/README.md#delays-frompre-target-services-iptables-nftables-cont) )
