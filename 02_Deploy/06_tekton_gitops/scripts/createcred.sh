#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "usage: ./createcred.sh [registry_url] [username] [password]"
    exit 1
fi

oc create secret docker-registry container-registry-secret \
    --docker-server=$1 \
    --docker-username=$2 \
    --docker-password=$3

oc patch serviceaccount pipeline \
  -p '{"secrets": [{"name": "container-registry-secret"}]}'
