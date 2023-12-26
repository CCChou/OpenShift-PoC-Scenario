#!/bin/bash

APPPROJECT=keda-demo
KEDAPROJECT=openshift-keda

oc new-project $APPPROJECT ; echo "--- Deploy App in" $(oc project -q) "---"

oc apply -f ./yaml/deployment.yaml \
  -f ./yaml/service.yaml \
  -f ./yaml/servicemonitor.yaml \
  -n $APPPROJECT;

oc apply -f ./yaml/keda-controller.yaml -n $KEDAPROJECT;

oc create serviceaccount thanos -n keda-demo;

oc apply -f ./yaml/role.yaml \
  -f ./yaml/rolebinding.yaml;