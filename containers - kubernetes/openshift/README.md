# OpenShift commands
Useful OpenShift commands
```sh
# Shell completion
# NOTE: package 'bash-completion' MUST be installed
oc completion -h
# then follow the instruction, for example:
source <(oc completion bash)
# Or similar command to .bash_profile, (but always take a look at 'oc completion -h' for information)

# oc login -u kubeadmin https://api.crc.testing:6443
oc login -u developer -p developer
oc get nodes
oc get routes

# Token, credentials, information
oc whoami
oc whoami --show-token=true
oc config view


# Getting apiserver info later on
oc get apiserver

# Cluster name configuration information
oc config getcluster
oc config current-context

# Show a list of all resources and API collection
oc api-resources
# Explain usage of these resources
oc explain
oc explain pod                  # Explain pod fields
oc explain pod.spec             # Specification of the desired behavior of the pod

# Projects/Devs
oc new-project myproject        # Create a new project
oc project lab                  # Switch to already existing 'lab' project

# Explicitly create a new app and some extra resources
# 'oc create deployment' is more straightforward if you just want a simple deploy
oc new-app httpd-example
oc new-app [registry/type/imagename]

# Deployments
oc create deployment labginx --image=bitnami/nginx

# Getting all resources for a user
oc get all

# Getting application status (deployments, pods, services, images and so on)
oc status

# Get pods information
oc get pods
oc get pods -A                  # You need admin privileges for getting all pods from system
oc get pods mypod -o yaml       # Generate yaml info about a single pod, you can copy and reuse it later
oc describe pod mypod           # Get information about <mypod> for troubleshooting
oc get pods,rs                  # Get pods and replicasets (comma is used to get multiple resources)
oc get pods,rs --show-labels    # Same as above but also shows labels applied to these resources
oc get pods --selector app=nginx        # Select all pods with label 'app=nginx'

# This command removes label 'app' from specified pod
# If pod is managed by a ReplicaSet then a new pod is automatically started
oc label pod mypod-123-xxx app-
oc label pod mypod-234-xxx storage=ssd  # Apply 'storage=ssd' label to selected pod (or resource)

# get logs for a specific resource
oc logs -f bc/httpd-example
oc logs mypod                   # Getting logs from specified pod

# Manually start a pod (you won't do it that much as long as Deployments are preferred way of running them)
oc run mymariadb --image=mariadb

# Edit directly a service called [servicename]
oc edit svc [servicename]

# Copy files to/from pod localSystem
oc cp [podname:path] [localName]
# Copy file index.html from pod to local dir
oc cp mynginx-123456-abcdef:/app/index.html index.html

# Set environment on a running pod, for example:
#   - Set environment variables on a running pod
oc set env [podname] [varname]=[value]
oc set env deploy/mysql-57-rhel57 MYSQL_ROOT_PASSWORD=mypassword

# Expose pod port on the local workstation where oc client is used.
# This is suitable for admin or dev user access, not for external users
oc port-forward [podname] [exposedPort]:[internalPort]
oc port-forward mynginx 8080:80

# Create a route
oc expose service [servicename]

# Create a ConfigMap (or 'oc create cm' as a shortcut)
# Create configmap from a file (Uploads it as configmap file type)
oc create configmap myconfigmap --from-file=index.html
# Describe a configmap
oc describe cm myconfigmap

#
# Create a volume from a configmap (with a file in it)
oc set volume deploy mynginx --add --type configmap --configmap-name myconfigmap --mount-path=/app/
```
