#!/bin/bash

URL=$(oc get services.serving.knative.dev autoscale-go |awk 'NR > 1 {print $2}')
echo "Call URL: $URL"
echo "---------------"

# 50 concurrency for 30 seconds
hey -z 30s -c 50 \
  "$URL?sleep=100&prime=10000&bloat=5" \
  && kubectl get pods