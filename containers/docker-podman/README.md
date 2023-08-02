# Useful commands

```sh
# Podman login to the specified registry with supplied credentials (for rootless containers)
podman login -u [username] -p [password] [registry.access.redhat.com]

# Search the container registry (red hat/docker.io), just like yum search
podman search ubi

# pull ubi image from container registry
podman pull ubi8/ubi

# Inspect and evaluate an image before downloading it
skopeo inspect -h
skopeo inspect [docker://imagepath]
# also:
podman image inspect [...]
# BUT: podman inspect what you have on disk, skopeo inspect image before pulling it
#      IF you use 'podman pull' and then 'podman inspect' is totally fine to run it
#      ...for example:
podman inspect registry.access.redhat.com/rhscl/mysql-57-rhel7

# Spot the difference, non root does not get images downloaded from sudo users
# rootless: images are stored in user home directory
# root: images are stored in /var/lib/containers/storage/overlay-images
podman images
sudo podman images

# Remove an image (container should not use it before removing)
podman rmi [imagename]
# Remove ALL images
podman rmi -a

# Remove container
podman rm [ContainerName/ID]


```

---
