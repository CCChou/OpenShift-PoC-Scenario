#!/bin/bash

oc apply -f yaml/placement.yaml
oc apply -f yaml/install-gatekeeper.yaml
oc apply -f yaml/constrainttemplate.yaml
oc apply -f yaml/allowrepos.yaml