#!/bin/bash

POD_NAME=$(oc get po -l app=hpa-test|awk 'FNR==2{print $1}')
oc exec $POD_NAME -- sysbench cpu --time=30 run
