#!/bin/bash

oc new-project quay-enterprise
oc create secret generic -n quay-enterprise --from-file config.yaml=yaml/config.yaml config-bundle-secret
oc apply -n quay-enterprise -f yaml/quay.yaml
