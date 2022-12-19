#!/bin/bash

URL=$(oc get route -n istio-system -l maistra.io/gateway-name=bookinfo-gateway|awk 'NR > 1 {print $2}')
echo "Call URL: $URL"
echo "---------------"

echo "Login the productpage"
curl -d "username=dennis" -d "passwd=dennis"  -c ./cookies.txt -X POST "http://$URL/login"

for i in {1..100}
do
    echo "Call URL $i times"
    curl  -b ./cookies.txt -I "http://$URL/productpage"
    echo "---------------"
done