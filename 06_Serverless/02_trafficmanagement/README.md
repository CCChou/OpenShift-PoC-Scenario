# Serverless 流量管理

## 環境資訊
1. OpenShift 4.10
2. Serverless 1.26
3. kn v1.5.0

## 部署

部署 blue 服務
```
oc apply -f yaml/service-blue.yaml
```

取得 url 並測試部署是否正確
```
oc get ksvc 
```

部署 green 服務
```
oc apply -f yaml/service-green.yaml
```

取得 url 並測試部署是否正確
```
oc get ksvc 
```

列出目前有的部署版本資訊
```
kn revision list -s blue-green-canary
```

替各部署版本上 tag
```
kn service update blue-green-canary --tag=blue-green-canary-00001=blue
kn service update blue-green-canary --tag=blue-green-canary-00002=green
```

根據前述 tag 設定流量權重
```
kn service update blue-green-canary --traffic blue=50,green=50
```