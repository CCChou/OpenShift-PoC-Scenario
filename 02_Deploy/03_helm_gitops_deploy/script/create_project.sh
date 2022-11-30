#!/bin/bash

oc new-project $1 ; echo "--- Deploy App in" $(oc project -q) "---"
oc label namespace $(oc project -q) argocd.argoproj.io/managed-by=openshift-gitops