#!/bin/bash

LOCAL_API_SERVER_URL=`oc config view --minify -o jsonpath='{.clusters[*].cluster.server}'`
LOCAL_API_SERVER_TOKEN=`oc whoami -t`

function openshiftlogin(){
	oc login -u $1 -p $2 --server=$3
}

