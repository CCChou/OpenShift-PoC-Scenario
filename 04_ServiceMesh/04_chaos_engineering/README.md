# Service Mesh 混沌工程

## 環境資訊
1. OpenShift 4.10
2. Service Mesh 2.3

## 部署

部署有錯誤注入的 VirtualService 物件
```
oc apply -f yaml/chaos_engineering.yaml
```

呼叫測試腳本
```
sh scripts/test.sh
```