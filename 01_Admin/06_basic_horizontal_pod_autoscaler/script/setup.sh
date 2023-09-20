#!/bin/bash

oc new-project $1 ; echo "--- Deploy App in" $(oc project -q) "---"

oc apply -f ./yaml/cpu_based_deployment.yaml -f ./yaml/cpu_based_hpa.yaml -n $1;