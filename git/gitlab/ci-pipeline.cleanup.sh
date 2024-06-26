#!/usr/bin/env bash
set -e
# Generate a new one from [Settings/Access Tokens] and grant user owner or aministrator permissions
#   - Project Settings / Access Tokens
#   - button [Add new token]
#       - Token name: "cleanup"
#       - Role: [Owner]
#       - Enable checkbox: [api],[read_api],[read_repository],[write_repository]
#       - Click button [Create Project Access Token]
#   - Click the eye icon to see the token ID, you won't see it anymore and paste it below
TOKEN="$(cat token.secret)"

# do not touch this script below this line
# --------------------------------------------------------------------------------------------------
# Unique gitlab project ID (Settings/General/Project ID)
PROJECT_ID="YOUR PROJECT ID"
# Set your gitlab instance url.
GITLAB_INSTANCE="https://gitlab.URL.you.ned/api/v4/projects"
# How many to delete from the oldest, 100 is the maximum, above will just remove 100.
# More than 100 ? just run it multiple times...
PER_PAGE=100
for PIPELINE in $(curl --header "PRIVATE-TOKEN: $TOKEN" "$GITLAB_INSTANCE/$PROJECT_ID/pipelines?per_page=$PER_PAGE&sort=asc" | jq '.[].id') ; do
    echo "Deleting pipeline $PIPELINE"
    curl --header "PRIVATE-TOKEN: $TOKEN" --request "DELETE" "$GITLAB_INSTANCE/$PROJECT_ID/pipelines/$PIPELINE"
done
