# Software
- Red Hat OpenShift Local
(formerly Red Hat CodeReady Containers)  
    https://developers.redhat.com/products/openshift-local/overview?extIdCarryOver=true&intcmp=7013a000002CtetAAC&sc_cid=701f2000001Css5AAC


# Container registries
- `/etc/containers/registries.conf` Configuration file where container hub sources are listed


# Code Ready Containers (aka: CRC)
**CRC**, aka: Code Ready Containers
```sh
# Deleting previous/existing version (if any)
crc delete

# Initial setup
crc version
crc setup

# Configuration: set, view
crc config
crc config view
crc config set cpus 8
crc config set memory 16384
# crc config set consent-telemetry <yes/no>

# Print current ip address of crc node
crc ip

# Start server
# crc start -p ~/Downloads/pull-secret
crc start
    #   Started the OpenShift cluster.
    #
    #   The server is accessible via web console at:
    #   https://console-openshift-console.apps-crc.testing
    #
    #   Log in as administrator:
    #   Username: kubeadmin
    #   Password: 5nsAa-vcSC4-RDI5K-fX9wT
    #
    #   Log in as user:
    #   Username: developer
    #   Password: developer
    #
    #   Use the 'oc' command line interface:
    #   $ eval $(crc oc-env)
    #   $ oc login -u developer https://api.crc.testing:6443


# Environment (once started)
eval $(./crc oc-env)

# Get sys credentials on local installation (CRC only)
crc console --credentials
```
