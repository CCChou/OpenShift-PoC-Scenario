#!/bin/bash

# 刪除 policy
for i in $(oc get policy -o wide -n default | sed -n '2,$p' | cut -d ' ' -f1)
do 
  echo "=== delete policy " $i " ===" ;
  oc delete policy $i;
done

# 刪除 namespace
oc delete projects minio-dev openshift-operators-redhat openshift-logging --force