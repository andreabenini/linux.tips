# Hints
## Manually add a repository
Oviously you can use `yum-config-manager` like this:
```sh
# yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```
but you can still do it manually with just one line:
```sh
curl https://download.docker.com/linux/centos/docker-ce.repo | cat > /etc/yum.repos.d/DockerCE.repo
```
