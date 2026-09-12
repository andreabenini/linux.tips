# gcloud command line utility

## gcloud handy commands
```sh
# Managing cloud resources via the gcloud CLI or using the Cloud SDK.
gcloud auth login
# Running local code or applications that call Google Cloud APIs.
gcloud auth application-default login

# Specifying which project pays for your local API requests
gcloud auth application-default set-quota-project <project name>

# Authentication active information
cat ~/.config/gcloud/application_default_credentials.json

# Detect compute region, if explicitly set
gcloud config get-value compute/region

# Google cloud project list (once authenticated)
gcloud projects list
# set a specific project as default
gcloud config set project <PROJECT_ID>
# get default project configuration
gcloud config get-value project
```
