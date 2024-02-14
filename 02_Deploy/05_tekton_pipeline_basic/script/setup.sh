#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "usage: ./setup.sh [project_name]"
    exit 1
fi

PROJECT_NAME=$1

oc new-project ${PROJECT_NAME}
oc apply -f yaml
