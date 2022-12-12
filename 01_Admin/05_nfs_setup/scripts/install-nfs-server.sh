#!/bin/bash

echo "Installing NFS Server ..."
oc new-project nfs-server
oc adm policy add-scc-to-user privileged -z default -n nfs-server
oc apply -f yaml/nfs-server.yaml
echo 'NFS Server installed successfully.'
