# OpenShift commands
```sh
# create a brand new configuration from the yaml file, raises error if it partially exists
oc create -f myConfig.yaml
# apply (or create) a configuration from yaml file, handy when you apply changes to already existing config
oc apply -f myConfig.yaml
```
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
# Getting current routes
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
oc new-app quay.io/bitnami/nginx
# Same as abov with a specific docker-image and a name for it
oc new-app --name wordpress --docker-image bitnami/wordpress
# even more params here..
oc new-app --template=mariadb-persistent \
    -p MYSQL_ROOT_PASSWORD=passwd -p VOLUME_CAPACITY=1Gi -p MEMORY_LIMIT=2Gi --as-deployment-config

# Deployments
oc create deploy mymariadb --image=mariadb
oc create deployment labginx --image=bitnami/nginx

# Getting all resources for a user
oc get all

# Basically the same for both commands
oc get is -n openshift
oc get imagestream -n openshift
# Get detailed information about a specific imagestream
oc describe is php -n openshift


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
oc label pod mypod-123-xxx  app-
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
#...or even better with a previously created secret, like:
#   oc create secret generic mysql --from-literal=password=mypassword
oc set env deploy mysql --prefix MYSQL_ROOT_ --from secret/mysql
oc set env deploy mymariadb --from=configmap/myconfigmap

# Expose pod port on the local workstation where oc client is used.
# This is suitable for admin or dev user access, not for external users
oc port-forward [podname] [exposedPort]:[internalPort]
oc port-forward mynginx 8080:80

# Create a route and expose a service or deploy, it creates a route for it
oc expose service [servicename]
oc expose svc wordpress
# NodePort is not recommended at all, routes should be used instead
oc expose deploy mynginx --type=NodePort --port=8080

# Create a ConfigMap (or 'oc create cm' as a shortcut)
# Create configmap from a file (Uploads it as configmap file type)
oc create configmap myconfigmap --from-file=index.html
# Create configmap from literal key:values
oc create configmap myconfigmap --from-literal=MYSQL_ROOT_PASSWORD=admin
# A more complex example (but same as above)
oc create cm wordpress-cm --from-literal=host=mysql --from-literal=name=wordpress --from-literal=user=root --from-literal=password=password
# Describe a configmap
oc describe cm myconfigmap

# Create a secret for docker authentication
# 'docker-registry' is a type of secret
oc create secret docker-registry docker \
            --docker-server=docker.io --docker-email=MYEMAIL \
            --docker-username=MYUSERNAME --docker-password=MYPASSWORD
# Make secret 'docker' the default pull secret
oc secret link default docker --for=pull
oc secret link default docker --for pull
# Creating a generic secret named 'docker' in this case
oc create secret generic docker \
            --from-file .dockerconfigjson=${XDG_RUNTIME_DIR}/containers/auth.json \
            --type kubernetes.io/dockerconfigjson
# Create a generic secret named mysql containing password=mypassword (key=value), from literal on command line
oc create secret generic mysql --from-literal=password=mypassword
# Describe as usual to gather some information from a secret
oc describe secret docker
# This outputs the base64 secret with all information about it
oc get secret docker -o yaml

# Enter in a shell for a specific deployment
# Display environment variables from that particular Deployment, do not enter in the shell
oc exec -it wordpress-xyz.. -- env

# Create (or add) a volume from a configmap (with a file in it) to the deployment 'mynginx'
oc set volume deploy mynginx --add --type configmap --configmap-name myconfigmap --mount-path=/app/
# Create a volume (1Gb) and a pvc for it, later attach it to deployment 'mysql', R/W mode and mount it to /var/lib/mysql
oc set volumes deployment/mysql --name mysql-pvc --add --type pvc --size 1Gi --claim-mode rwo --mount-path /var/lib/mysql

# Show available templates from OpenShift installation (kubeadmin and ordinary user too)
oc get templates -n openshift
# Get a specific template from the list and describe it all
oc get template mariadb-persistent -n openshift -o yaml | less
# Describe a template and list used parameters
oc describe template TemplateName
# to describe parameters from the template
# Report all parameters required from the selected template
oc process --parameters TemplateName -n openshift -o yaml |less
# Generate a template yaml file locally (mariadb-ephemeral.yaml)
# You can later identify and set proper parameter and later process the generated template with them
# (1) Generate local template from template
oc get template mariadb-ephemeral -o yaml -n openshift > mariadb-ephemeral.yaml
# (2) Show parameters inside the template
oc process --parameters mariadb-ephemeral -n openshift
# (3) Process these parameters and set them with a value according to your needs
oc process -f mariadb-ephemeral.yaml -p MYSQL_USER=ben -p MYSQL_PASSWORD=pass -p MYSQL_DATABASE=books | oc create -f


# Source 2 Image

# Get different builds around (if any)
oc get builds
```
