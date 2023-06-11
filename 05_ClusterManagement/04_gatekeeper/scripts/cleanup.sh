#!/bin/bash

# Only Clean Constraint and Policy, so the gatekeeper will keep
oc delete -f yaml/allowrepos.yaml
oc delete -f yaml/constrainttemplate.yaml
oc delete K8sAllowedRepos repo-is-rhtw
oc delete constrainttemplate k8sallowedrepos