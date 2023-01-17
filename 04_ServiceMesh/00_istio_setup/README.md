# Service Mesh 維運管理

## 環境
1. OpenShift 4.10
2. Service Mesh 2.3

## 安裝

安裝 istio control plane
```
oc apply -f yaml/istio-components.yaml
```

部署 sample app
```
sh scripts/deploy_app.sh [namespace]
```
