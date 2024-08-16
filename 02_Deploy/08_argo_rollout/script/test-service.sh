
echo "test online service";
curl -k "$(oc get routes products-umbrella-online -n gitops --template='https://{{.spec.host}}')/products" | jq;

sleep 10;

echo "test offline service";
curl -k "$(oc get routes products-umbrella-offline -n gitops --template='https://{{.spec.host}}')/products" | jq;