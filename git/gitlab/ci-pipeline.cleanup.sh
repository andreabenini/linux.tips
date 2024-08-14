#!/usr/bin/env bash
# Enable the exit on error option to avoid endless if..else statements across the script
set -e
# Generate a new one from [Settings/Access Tokens] and grant user owner or aministrator permissions
#   - Project Settings / Access Tokens
#   - button [Add new token]
#       - Token name: "cleanup"
#       - Role: [Owner]
#       - Enable checkbox: [api],[read_api],[read_repository],[write_repository]
#       - Click button [Create Project Access Token]
#   - Click the eye icon to see the token ID, you won't see it anymore and paste it below
TOKEN=$(cat $(dirname "$0")/token.secret)
KEEP_PIPELINES=200

# do not touch this script below this line
# --------------------------------------------------------------------------------------------------
# Unique gitlab project ID (Settings/General/Project ID)
PROJECT_ID="YOUR PROJECT ID"
# Set your gitlab instance url.
GITLAB_INSTANCE="https://gitlab.URL.you.need/api/v4/projects"
# Count pipelines in the repository (default:100, Cannot count or delete more in a single shot)
PER_PAGE=100
NUM=$PER_PAGE
PIPELINES_COUNT=0
PAGE=1
while [ $NUM -ge $PER_PAGE ]; do
    NUM=$(curl --insecure --header "PRIVATE-TOKEN: $TOKEN" "$GITLAB_INSTANCE/$PROJECT_ID/pipelines?per_page=$PER_PAGE&page=$PAGE&sort=asc" 2>/dev/null | jq '.[].id' | wc -l)
    PAGE=$((PAGE+1))
    PIPELINES_COUNT=$((PIPELINES_COUNT+NUM))
done
# Delete exceeding pipelines to $KEEP_PIPELINES
PIPELINES_DELETE=$((PIPELINES_COUNT-KEEP_PIPELINES))
if [ $PIPELINES_DELETE -le 0 ]; then
    echo -e "\nNothing to delete, $((-PIPELINES_DELETE)) pipelines are still missing before deletion\n"
    exit 0
fi
echo "Pipelines  Total:$PIPELINES_COUNT, Delete:$PIPELINES_DELETE"
while [ $PIPELINES_DELETE -gt 0 ]; do
    for PIPELINE in $(curl --insecure --header "PRIVATE-TOKEN: $TOKEN" "$GITLAB_INSTANCE/$PROJECT_ID/pipelines?per_page=$PER_PAGE&sort=asc" 2>/dev/null | jq '.[].id') ; do
        echo "    - delete $PIPELINE, remaining: $((PIPELINES_DELETE-1))"
        curl --insecure --header "PRIVATE-TOKEN: $TOKEN" --request "DELETE" "$GITLAB_INSTANCE/$PROJECT_ID/pipelines/$PIPELINE"
        PIPELINES_DELETE=$((PIPELINES_DELETE-1))
        if [ $PIPELINES_DELETE -le 0 ]; then
            break;
        fi
    done
done
echo "Operation completed"
