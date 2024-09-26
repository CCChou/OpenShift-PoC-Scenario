#!/bin/bash
unset $1
unset $2

set -o nounset
set -o errexit
set -o pipefail

# Get machineset name to generate a generic template
export ref_machineset_name=$(oc get machinesets -n openshift-machine-api |grep worker |awk '{ print $1 }')

# Replace machine name worker to gpu
export gpu_machineset_name=$(echo $ref_machineset_name | sed s/worker/gpu/)

# Replace machine replicas number
export NODE_NO=$(echo "${1:-2}")

# Desired GPU instance type
export instance_type=$(echo "${2:-g5.4xlarge}")	

dir=/tmp/gpu-ci
mkdir -p "${dir}/"

# Get a templated json from a running machine, change machine type and machine name
# and pass it to oc to create a new machine set
set +o errexit
oc get -n openshift-machine-api machineset $ref_machineset_name -o json \
    | jq 'del(.status)|del(.metadata.selfLink)|del(.metadata.uid)' \
    | jq --arg instance_type "${instance_type}" '.spec.template.spec.providerSpec.value.instanceType = $instance_type' \
    | jq --arg gpu_machineset_name "${gpu_machineset_name}" '.metadata.name = $gpu_machineset_name' \
    | jq --arg gpu_machineset_name "${gpu_machineset_name}" '.spec.template.metadata.labels."machine.openshift.io/cluster-api-machineset" = $gpu_machineset_name' \
    | jq --arg gpu_machineset_name "${gpu_machineset_name}" '.spec.selector.matchLabels."machine.openshift.io/cluster-api-machineset" = $gpu_machineset_name' \
    | jq --argjson NODE_NO "${NODE_NO}" '.spec.replicas = $NODE_NO' \
    | oc create -f-
ecode=$?
set -o errexit