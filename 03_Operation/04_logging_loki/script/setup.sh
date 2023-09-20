#!/bin/bash

oc apply -f yaml/loki-stack.yaml
oc apply -f yaml/clusterlogging.yaml
oc process -f yaml/eventrouter.yaml | oc apply -n openshift-logging -f -
oc apply -f yaml/auditlogforward.yaml
