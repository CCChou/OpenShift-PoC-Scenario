# 多叢集規則執行順序

## 環境資訊
1. OpenShift 4.12
2. ACM 2.7

## 環境部署與展示

### 場景一：一站式自動部署 policy 流程

建立 Placement
```
oc apply -f yaml/placement.yaml -n default
```

建立 Policy
```
oc apply -f yaml/lokistack-full.yaml  -n default
```

於 Web Console 上進入 minio-dev project 並找到 Route 登入 minio，接著手動建立 bucket 與對應的使用者。  
1. 選擇 Bucket
  ![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/03_policyorder/image/create_bucket_01.png)
2. 建立 Bucket
  ![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/03_policyorder/image/create_bucket_02.png)
3. 選擇 identity
  ![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/03_policyorder/image/create_admin_user_01.png)
4. 建立 admin user
  ![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/03_policyorder/image/create_admin_user_02.png)

手動建立 loki minio 連線資訊的 secret
```
oc apply -f yaml/loki-secret.yaml
```

在 Installed Operator 內找到 Red Hat OpenShift Logging Operator 並點選左側 Console Plugin 選擇 Enable，接著便能檢查 Observe -> Log 查看日誌是否正常安裝完畢。  
> TODO 加個圖

### 場景二：分段式自動部署 policy 流程(範例: 系統先確認 minio 已建立，再建立 loki)

建立 Policy
```
oc apply -f yaml/minio-dev.yaml  -n default
oc apply -f yaml/lokistack.yaml  -n default
```
其餘步驟皆場景一

### 清除環境
```
./clenup.sh
```