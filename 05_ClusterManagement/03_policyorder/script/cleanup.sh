#!/bin/bash

# 刪除 policy
for i in (oc get policy -o wide -n default | sed -n '2,$p' | cut -d ' ' -f1)
do 
  oc delete policy $i
done

# 刪除 namespace
oc delete namespace minio-dev,openshift-operators-redhat,openshift-logging

# 刪除 operator group
oc delete operatorgroup openshift-operators-redhat,openshift-logging

# 刪除 operator subscription
oc delete subscription loki-operator,cluster-logging