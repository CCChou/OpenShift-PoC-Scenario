#!/bin/bash

if [ "$#" -ne 1 ]; then
    export NAMESPACE="bookinfo"
fi
if [ "$#" -eq 1 ]; then
    export NAMESPACE=$1
fi 


envsubst < yaml/bookinfo.yaml | oc apply -f -