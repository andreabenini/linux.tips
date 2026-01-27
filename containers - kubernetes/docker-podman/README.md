# Useful commands


## Basic and getting started, hello world
```sh
# Best ever hello world example
podman run busybox echo "hello"

# Basic image in 5secs from universal base image 9
cat <<EOT > Containerfile
FROM ubi9:latest
MAINTAINER Tux tux@example.com
USER root
EOT
```


## Version and general information
```sh
# Show current version
podman --version
# Display system-wide information about podman
podman info
```


## Registry related commands
```sh
# Podman login to the specified registry with supplied credentials (for rootless containers)
podman login -u <username> -p <password> <registry.access.redhat.com>
#...to skip self signed certificates on internal quay registries just add the skip flag to it
podman login -u <username> -p <password> --tls-verify=false <https://internal.quay.registry.domain.com>

# Search the container registry (red hat/docker.io), just like yum search
podman search ubi

# pull ubi image from container registry
podman pull ubi8/ubi

# Inspect and evaluate an image before downloading it
skopeo inspect -h
skopeo inspect <docker://imagepath>
# also:
podman image inspect <...>
# BUT: podman inspect what you have on disk, skopeo inspect image before pulling it
#      IF you use 'podman pull' and then 'podman inspect' is totally fine to run it
#      ...for example:
podman inspect registry.access.redhat.com/rhscl/mysql-57-rhel7

# Push an image to a Container registry
podman push <name>:<tag>
```


## Image manipulation commands
```sh
# Spot the difference here, non root does not get images downloaded from sudo users
#   rootless:   - images are stored in user home directory
#   root:       - images are stored in /var/lib/containers/storage/overlay-images
podman images [-a]
sudo podman images

# Pull an image from the container hub
podman pull <image>

# Build an image from a Container Hub
podman build -t <name>[:<tag>] <path>
# Building images (from local directory)
podman build -t <imageName> .

# Remove an image (container should not use it before removing)
podman rmi <image>
# Remove ALL images
podman rmi -a
```


## Container commands
```sh
## PS
# List running containers
podman ps
# List all containers (both running and stopped)
podman ps -a

## RUN
# Run a container from an image
podman run <image>
# Run a container in detached/daemon mode (in the background)
podman run -d <image>
# Run a container with a custom name
podman run --name <name> <image>
#... and some samples too
# Start a command in the container shell and exists when done
podman run ubi8/ubi echo "hello world"
# Downloading container image from registry and running it locally, this does not stop (it's a system container)
podman run nginx
# Same as above but run the container as a daemon in the background even if it's a system container (detached)
podman run -d nginx
# To detach from a running container while you're inside it you can press: Ctrl-p, Ctrl-q 
#       this detaches the shell from a running container, or something like:
podman run --detach --name containerimage --publish 8080:80 mywebcontainer
# Start a container and put the user inside the maching by using the interactive mode (-it) and required shell (/bin/bash)
# This command does not start the default entrypoint but it runs the shell instead
podman run -it ubi8/ubi /bin/bash
# this fails, it's a service and asks various vars to run it
sudo podman run mariadb
# podman run with environment variables, see each single specific podman command
# podman -e key=value
sudo podman run -d -e MYSQL_ROOT_PASSWORD=password mariadb
# podman run with env variables and volume mount
sudo podman run -d -v /srv/dbfiles:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password mariadb
# This :Z option takes care of SELinux context directly and it's the preferred way for running rootless containers
sudo podman run -d -v /srv/dbfiles:/var/lib/mysql:Z -e MYSQL_ROOT_PASSWORD=password mariadb

## STOP
# stop a running container
podman stop <container>

## START/RESTART
# start a stopped container
podman start <container>
# restart a container
podman restart <container>

## RM
# Remove container
podman rm <containerID>

## EXEC
# Access a running container's shell
podman exec -it <ContainerName> /bin/bash

## Tags
# Tag an image with a new name and/or tag
podman tag <image> <newName>:<tag>
# Applying a tag to docker.io/bitnami/nginx. 
# Now 'podman images' shows that new tag (and referred to the same ImageID)
podman tag docker.io/bitnami/nginx localhost:5000/bitnami/nginx:testing

# Save an image in a tar file and load it later
podman save nginx:latest -o nginx.tar
podman load -i nginx.tar

# Inspect all different properties of an image, even tags
podman inspect ubi8
# -l: Run command on latest run container
# -f: Get information from the networking in this case
podman inspect -l -f "{{.NetworkSettings.IPAddress}}"

# Show last error logs from container (useful for debugging)
podman logs <container>
# Follow logs of a container
podman logs -f <container>

# Get disk space usage
podman system df
podman system df -v
```


## Dealing with Volumes
```sh
# List all container volumes
podman volume ls
# Create a new container volume
podman volume create <name>
# Display details about a container volume
podman volume inspect <name>
# Attach a volume to a container
podman run -v <volume>:/<path> <image>
# Remove a container volume
podman volume rm <volume>
```


## Container networks
```sh
# List all podman available networks
podman network ls
# Create a new podman network
podman create <name>
# Display details about a podman network
podman network inspect <network>
# Remove a container network
podman network rm <network>
# Connect a container to a network
podman network connect <network> <container>
# Disconnect a container from a network
podman network disconnect <network> <container>
```


## SELinux permissions and storage
```sh
# Inspect image and look for [User] to find which user this is
podman inspect image
# Evaluate an image to understand user permissions, example:
    podman inspect registry.access.redhat.com/rhscl/mysql-57-rhel7
    #> "User": "27",
    sudo mkdir /srv/dbfiles
    sudo chown -R 27:27 /srv/dbfiles

# Setting UUID permissions on host side (as usual), ID refers to what previous inspection reported
sudo chown -R <id>:<id> /hostdir

# Set SE Linux permissions on dir
sudo semanage fcontext -a -t container_file_t "/hostdir(/.*)?"
# as in previous example the semanage command might look like this:
    sudo semanage fcontext -a -t container_file_t "/srv/dbfiles(/.*)?"

# Apply SELinux policies just set on the host side. YOU NEED TO EXECUTE IT BEFORE using file system
sudo restorecon -Rv /hostdir
    sudo restorecon -Rv /srv/dbfiles

# SELinux permission check
sudo ls -ladZ /srv/dbfiles/

# Mount the newly applied storage dir back to the image (and create a new container)
podman run -v /hostdir:/dir-in-container myimage
```

## Generating systemd services for containers
```sh
# Generate a service file from a running container
# This is a user generated service file, adapt it to match your settings for a system wide one
podman generate systemd --new --name homeassistant > ~/.config/systemd/user/homeassistant.service
```
