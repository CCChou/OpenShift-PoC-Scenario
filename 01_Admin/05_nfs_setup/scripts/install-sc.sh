#!/bin/bash

NODE_PORT=$(oc get svc -l app=nfs-server -n nfs-server -ojsonpath='{.items[0].spec.ports[0].nodePort}')
NODE_NAME=$(oc get po -n nfs-server -owide|awk 'NR>1 {print $7}')
NODE_IP=$(oc get no ${NODE_NAME} -ojsonpath='{.status.addresses[0].address}')

export NODE_PORT=${NODE_PORT}
export NODE_IP=${NODE_IP}

envsubst < yaml/nfs-sc.yaml | oc apply -f -