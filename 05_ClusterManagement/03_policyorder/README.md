# 多叢集規則執行順序

## 環境資訊
1. OpenShift 4.12
2. ACM 2.7

## 環境部署與展示

建立 Policy
```
oc apply -f yaml/lokistack-full.yaml
```

於 Web Console 上進入 minio-dev project 並找到 Route 登入 minio，接著手動建立 bucket 與對應的使用者。  
> TODO 加個圖

手動建立 loki minio 連線資訊的 secret
```
oc apply -f yaml/loki-secret.yaml
```

在 Installed Operator 內找到 Red Hat OpenShift Logging Operator 並點選左側 Console Plugin 選擇 Enable，接著便能檢查 Observe -> Log 查看日誌是否正常安裝完畢。  
> TODO 加個圖
