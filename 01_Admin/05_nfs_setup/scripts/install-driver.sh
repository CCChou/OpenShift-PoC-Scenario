#!/bin/bash

echo "Installing NFS CSI driver ..."
kubectl apply -f yaml/rbac-csi-nfs.yaml
kubectl apply -f yaml/csi-nfs-driverinfo.yaml
kubectl apply -f yaml/csi-nfs-controller.yaml
kubectl apply -f yaml/csi-nfs-node.yaml
echo 'NFS CSI driver installed successfully.'
