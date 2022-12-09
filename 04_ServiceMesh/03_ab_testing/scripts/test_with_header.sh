#!/bin/bash

URL=$(oc get route -n istio-system -l maistra.io/gateway-name=bookinfo-gateway|awk 'NR > 1 {print $2}')
echo "Call URL: $URL"
echo "---------------"

for i in {1..100}
do
    echo "Call URL with header end-user:dennis $i times"
    curl --header "end-user:dennis" -I "http://$URL/productpage"
    echo "---------------"
done