# Arch Linux 
## Installation
A good package from AUR contribution saves a lot of time and works without troubles
```sh
# AUR deploy and install
git clone https://aur.archlinux.org/k3s-bin
cd k3s-bin
makepkg -si
```
Classic installation is present but _AUR_ package is way better than follwing the common installer.
Default installation method listed below is not recommended
```sh
# curl -sfL https://get.k3s.io | sh -
# or even better, so you can debug it later if it fails
curl -sfL https://get.k3s.io > install.sh; sh install.sh
```

## Configuration
### **_rootless forever_**
- It's a good practice to run K3S (and every container engine) in a rootless environment. It's tricky
    and usually require extra steps but it's definitively a good security practice (and that's also
    why I usually prefer podman over docker)
- In `/etc/sysctl.d/k3s.conf` there are few settings to apply in order to get proper configuration
    ```sh
    cat <<EOF | sudo tee /etc/sysctl.d/k3s.conf
    # Enable IPv4 forwarding for internal kubernetes pods
    net.ipv4.ip_forward=1
    EOF
    ```
- Then configuration must be applied: `sysctl --system`
- Enable cgroup resources delegations for computer users
    ```sh
    # Adding delegations
    sudo mkdir -p /etc/systemd/system/user@.service.d
    cat <<EOF | sudo tee /etc/systemd/system/user@.service.d/delegate.conf
    [Service]
    Delegate=cpu cpuset io memory pids
    EOF
    # Reload
    sudo systemctl daemon-reload
    ```
- Enable cgroups v2. _This should **be a default** on Arch Linux now_. Update or refer to it in order to
    understand if there's something more to setup.  
    **There is no need to setup kernel boot parameters**, cgroup v2 is now working out of the box
    with newer systemd (>240)
- Detect cgroup setup. This oneliner provides all required information:
    ```sh
    cat /sys/fs/cgroup/user.slice/user-$(id -u).slice/user@$(id -u).service/cgroup.controllers
    # Should return: "cpuset cpu io memory pids", consult your Arch docs otherwise
    ```
- #### Startup
    - According to **Note** in the 
        [Starting rootless servers](https://docs.k3s.io/advanced#starting-rootless-servers)
        it is **a bad practice** to start k3s with this command from the shell in a terminal:
        `k3s server --rootless`. Terminal sessions **do not allow** cgroup v2 delegation.
        It's fine to start it once for a barebone test but it is a bad practice and it should be
        discouraged, a systemd wrapper for a one shot test might be:
        ```sh
        systemd-run --user -p Delegate=yes --tty k3s server --rootless
        ```
    - Download: https://github.com/k3s-io/k3s/blob/master/k3s-rootless.service
        ```sh
        # Download the .service file
        mkdir ~/.config/systemd/user/ 2>/dev/null
        curl https://raw.githubusercontent.com/k3s-io/k3s/master/k3s-rootless.service > ~/.config/systemd/user/k3s-rootless.service
        ## NOTE: double check k3s location, usually on arch is /usr/bin and NOT /usr/local/bin
        ##       Change it accordingly.

        # Reload the configuration
        systemctl --user daemon-reload
        
        # Enable the new service (if you want to have it enabled)
        systemctl --user enable --now k3s-rootless
        # Start it manually (if you don't have it enabled on startup)
        # systemctl --user start k3s-rootless
        
        # Check status, consult journal, troubleshoot and so on...
        systemctl --user status k3s-rootless
        ```


### **default/classic root environment**  
It's pretty straight forward and just as easy as starting services and check them later
```sh
systemctl start  k3s
systemctl status k3s

# Change cluster hostname, if needed
sudo vim /etc/rancher/k3s/k3s.yaml
systemctl restart k3s
```


## User's environment setup
For local user admin it's advisable to have a working config in the home dir, might be something like:
```sh
mkdir ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
```


## Checking cluster configuration
it might be a good idea to see if nodes and pods are where they should be:
```sh
# Detect control-plane and running pods
kubectl get nodes
kubectl -n kube-system get pods
```
