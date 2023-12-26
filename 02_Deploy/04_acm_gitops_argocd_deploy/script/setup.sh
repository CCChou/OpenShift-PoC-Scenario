#!/bin/bash

oc apply -f ./yaml/managedclusterset.yaml;

oc label managedcluster remote-ocp cluster.open-cluster-management.io/clusterset=demo-gitops;
oc label managedcluster local-cluster cluster.open-cluster-management.io/clusterset=demo-gitops;
oc label managedcluster local-cluster environment=production;
oc label managedcluster remote-ocp environment=cloud;
