# 50 concurrency for 30 seconds
hey -z 30s -c 50 \
  "https://test-demo-knative.apps.cluster-jnrd8.jnrd8.sandbox2379.opentlc.com?sleep=100&prime=10000&bloat=5" \
  && kubectl get pods