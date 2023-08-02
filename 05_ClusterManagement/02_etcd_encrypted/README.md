# 多叢集規則 - etcd 是否加密

## 環境資訊
1. OpenShift 4.12
2. ACM 2.7

## 環境部署與展示
Apply policy 檔案
```
oc apply -f yaml/policy.yaml
oc apply -f yaml/placement.yaml
```

檢查 Policy 結果  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/02_etcd_encrypted/image/01.png)
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/02_etcd_encrypted/image/02.png)

Apply Remediation 為 enforce 的 policy
```
oc apply -f yaml/policy-enforce.yaml
```

查看狀態，可以發現問題已自動修復  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/02_etcd_encrypted/image/03.png)
