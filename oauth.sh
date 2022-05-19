#!/usr/bin/env bash
#
# OAUTHv2 sample with bash scripting and curl
#

# Input parameters
if [ "$2" == "" ]; then
    echo "$0 <username> <password>"
    exit 1
fi
USERNAME=$1
PASSWORD=$2

# URLs
OAUTH_SERVER="https://your.remote.host/with/oauth/v2/token"
SERVICE="https://your.remote.host/web/service/to/call/with/bearer?searchstring=WhatToSearch"

# Getting bearer token, adapt the grep/sed thing to fix generated output from this one
BEARER=$(curl --location --silent --request POST "$OAUTH_SERVER" \
              --header 'Content-Type: application/x-www-form-urlencoded' \
              --data-urlencode "client_id=$USERNAME" \
              --data-urlencode "client_secret=$PASSWORD" \
              --data-urlencode "grant_type=client_credentials" \
              --data-urlencode "Content-Type=application/x-www-form-urlencoded" \
         | grep access_token|sed -e 's/^.*:"//' -e 's/".*$//')
# New query, this time with the proper bearer
curl --silent --location --request GET "$SERVICE" --header "Authorization: Bearer $BEARER"
