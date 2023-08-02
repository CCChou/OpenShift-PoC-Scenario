#!/bin/bash

oc get secret central-htpasswd -n stackrox -ojsonpath='{.data.password}'|base64 -d