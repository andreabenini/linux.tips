# HELM Charts
- installation
    ```sh
        helm repo list
        # $USERNAME, $PASSWORD but even the entire [helm registry...] command could be taken from account credentials
        # command from token request listed below or from rancher.access.token.md.sample file
        helm registry login dp.apps.rancher.io -u $USERNAME -p $PASSWORD
        helm repo list
        # Helm template evaluation on stdout
        helm template VERSION TYPE://URL/charts/Application [--namespace $NAMESPACE]
        # ...and installation
        helm install VERSION TYPE://URL/charts/Application --namespace $NAMESPACE [--dry-run]
    ```
- upgrades
    ```sh
        # Adding handy 'diff' command to helm, adjust repo name and version accordingly
        helm plugin install https://github.com/databus23/helm-diff
        # Show additions, deletions and modifications
        helm diff upgrade VERSION TYPE://URL/charts/Application [--values my-values.yaml]
    ```
- Uninstall
    ```sh
        # Uninstall an helm chart
        helm uninstall VERION -n $NAMESPACE
    ```
- management
    ```sh
        # Getting manifest for an already installed package
        helm get manifest RELEASE_NAME
        # Show available variables for the char
        helm show values TYPE://URL/charts/Application

        # Getting specs from the repository, untar in current working dir as an option
        # - _Always_ use this to better evaluate the chart
        # - _Always_ look at newly generated values.yaml file for seeing available configurations
        helm pull TYPE://URL/charts/Aplication [--untar]

        # Manage installed charts
        helm list --namespace $NAMESPACE
    ```
- creation
    ```sh
        # Create a basic helm chart
        helm create myapp
        cd myapp
    ```
    - jinja templating engine all around, just be warned about it
    - `Chart.yaml` The **"ID card"** for the chart, contains metadata like name and version
    - `values.yaml` The **"control panel"** for the chart  
        This is where configuration values definition can be easily changed by users
    - `templates/deployment.yaml` The template for creating the Kubernetes Deployment which
        manages the application's pods.
    - `templates/service.yaml` The template for creating the Kubernetes Service, which exposes
        the application to the network.
    - Ignore or customize `_helpers.tpm`, `NOTES.txt`, `ingress.yaml` later on if needed

    To preview, install and customize:
    - preview
    ```sh
        # Preview what Kubernetes resources will be created
        helm template my-first-release ./myapp
    ```
    - install
    ```sh
        # Install the chart in the cluster
        helm install my-first-release ./myapp
    ```
    - uninstall
    ```sh
        # Uninstall and clean the chart from the cluster
        helm template my-first-release ./myapp
    ```
    - extending it
        - Add values in `values.yaml` file
        - Use these values in `templates/deployment.yaml` (or similar) files for example

