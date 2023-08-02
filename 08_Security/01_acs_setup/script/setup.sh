#!/bin/bash

oc apply -f yaml/operator.yaml

echo "---------"
echo "Wait 3 seconds for operator CRDs creation"
echo "---------"
sleep 3

oc apply -f yaml/central.yaml