# 資源管理

## 環境資訊
1. OpenShift 4.12

## 部署

部署 httpd 服務作為初始範例
```
oc apply -f yaml/httpd.yaml
```

建立 ResourceQuota 展示其以 project 單位的資源管理能力
```
oc apply -f yaml/resourcequota.yaml
```

將 pod 數量調整至 6 展示超過 ResourceQuota 的上限時行為
```
oc apply -f yaml/httpd-five.yaml
```