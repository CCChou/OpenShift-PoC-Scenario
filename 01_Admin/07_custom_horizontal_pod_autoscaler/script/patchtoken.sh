#!/bin/bash

TOKEN=$(oc describe sa thanos | grep token | awk -F ":" '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//');

echo "thanos token is " $TOKEN;

oc patch triggerauthentication keda-trigger-auth-prometheus --type='json' -p  "[{\"op\": \"replace\", \"path\": \"/spec/secretTargetRef/0/name\", \"value\": \"$TOKEN\" }]";
oc patch triggerauthentication keda-trigger-auth-prometheus --type='json' -p  "[{\"op\": \"replace\", \"path\": \"/spec/secretTargetRef/1/name\", \"value\": \"$TOKEN\" }]";