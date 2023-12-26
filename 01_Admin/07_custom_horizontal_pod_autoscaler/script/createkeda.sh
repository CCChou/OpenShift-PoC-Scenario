#!/bin/bash

oc create -f ./yaml/user_workload_configmap.yaml;

oc apply -f ./yaml/triggerauthentication.yaml \
  -f ./yaml/scaledobject.yaml;

