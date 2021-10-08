# Quick commands
```sh
# Configure minikube to use kvm/docker/...
# Always use kvm, seems to be a more performant driverq
minikube config set driver kvm2
minikube config set driver docker
# Start/Stop
minikube start
minikube stop

# Generic info
minikube ip                         # IP address
minikube status                     # Cluster status
minikube version                    # Cluster version

# Wipe cluster information and start from scratch
minikube delete
rm -rf $HOME/.minikube

# Dashboard information
minikube dashboard

# Addons/Plugins
minikube addons list                # Plugin list
minikube addons enable ingress      # Enable internal ingress controller
```
