#!/bin/bash

ROXPASSWORD=$(oc get secret -n stackrox central-htpasswd -oyaml | grep "password" | awk '{print $2}' | base64 -d);
echo $ROXPASSWORD;

ROXURL=$(oc get route central -n stackrox|awk 'NR > 1 {print $2}');
echo $ROXURL;

ROXTOKEN=$(curl -sk -u "admin:$ROXPASSWORD" "https:/$ROXURL/v1/apitokens/generate" -d '{"name":"roxsecret", "role": "Admin"}' | jq -r '.token');

echo "ROX API TOKEN is " $ROXTOKEN;

oc patch secret -n pipeline-demo roxsecret \
  -p "{\"stringData\": {\"rox_api_token\": \"$ROXTOKEN\"}}";