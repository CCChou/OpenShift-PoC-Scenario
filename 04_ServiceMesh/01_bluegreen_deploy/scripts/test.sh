#!/bin/bash

URL=$(oc get route -n istio-system -l maistra.io/gateway-name=bookinfo-gateway|awk 'NR > 1 {print $2}')
echo "Call URL: " $URL
echo "---------------"
curl -I "http://$URL/productpage"