# Install docker on a linux mint machine
As root you need to execute these steps
```
apt install apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
# or just:
#    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" >> \
#         /etc/apt/sources.list.d/additional-repositories.list 
```

# Install docker compose
- Check out https://github.com/docker/compose/releases to see latest available release
```
RELEASE=<Check Latest Release From Site Above>
curl -L https://github.com/docker/compose/releases/download/$RELEASE/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
' docker-compose version $VERSION, build xxxxx'
```

# Simple hello world test with compose
```
mkdir hello-world
cd hello-world
echo -e "my-test:\n    image: hello-world" > docker-compose.yml
docker images
'REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE'
docker-compose up
docker images
'REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE'
'hello-world         latest              4ab4c602aa5e        13 days ago         1.84kB'
```

# Show images
```
docker ps -a             # Running dockers
docker images            # Show available images
```

# Remove an image
```
docker ps -a
```
to see the CONTAINER ID. From there you can remove the container with
```
docker rm <CONTAINER ID>
```
to physically remove the machine from disk just issue:
```
docker rmi <REPOSITORY_NAME>
# with previous example is "hello-world"
```
