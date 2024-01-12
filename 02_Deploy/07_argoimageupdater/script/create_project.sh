#!/bin/bash

oc new-project $1 ; echo "--- Deploy App in" $(oc project -q) "---"

echo "--- label to managed by openshift gitops ---"
oc label namespace $(oc project -q) argocd.argoproj.io/managed-by=openshift-gitops