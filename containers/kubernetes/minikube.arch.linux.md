# Installation steps:
Really easy... just follow these steps:
```
# base packages, libvirt, dnsmasq and qemu are NOT dependencies but ARE mandatory
sudo pacman -S minikube libvirt qemu dnsmasq ebtables dmidecode
# Add current user to libvirt
sudo usermod -aG libvirt $(whoami)

# Start libvirtd
systemctl restart libvirtd
systemctl status libvirtd

# Network configuration (with qemu and kvm)
minikube config set driver kvm2

# Cluster initialization: delete/start/status
minikube delete
minikube start
minikube status
```
