# Quay 安裝

使用 MinIO 作為 Object Storage 來安裝 Quay

## 環境資訊
1. OpenShift 4.12
2. Quay Operator 3.8

## Install MinIO

Apply minio yaml
```
oc apply -f yaml/minio-dev.yaml
```

以上指令會建立 minio-dev project 並部署測試用 MinIO，部署完畢後可以透過 Route 登入 MinIO 介面進行設定，預設 root 帳密為 minioadmin / minioadmin。  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/01_Admin/02_quay_minio_install/img/01.png)  

建立 quay bucket  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/01_Admin/02_quay_minio_install/img/02.png)  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/01_Admin/02_quay_minio_install/img/03.png)  

建立 minio 使用者 quay 密碼使用 openshift4!，權限則給定 RedWrite 即可
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/01_Admin/02_quay_minio_install/img/04.png)  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/01_Admin/02_quay_minio_install/img/05.png)  

## Install Quay

從 OperatorHub 安裝 Red Hat Quay Operator，並使用以下 script 建立 Quay Registry
```
sh script/setup.sh
```

## Quay 維運管理
TODO