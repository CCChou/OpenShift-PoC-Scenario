# Network Observability

## 環境資訊
1. OpenShift 4.12
2. Network Observability 1.2.0

## 部署

部署 lokistack
```
oc apply -f yaml/lockstack.yaml
```

部署 FlowCollector
```
oc apply -f yaml/flowcollector.yaml
```

## TODO
1. Add demo application
2. Fix FlowCollector setting to use insecureSkipVerify=false not true