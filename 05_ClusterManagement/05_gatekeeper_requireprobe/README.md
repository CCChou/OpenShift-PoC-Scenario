# ACM with gatekeeper 檢查 Resource 限制設定

## 環境
1. OpenShift 4.12
2. ACM 2.7

## 使用指引
呼叫 script 建立相關 policy，之後會由 policy 自動建立 Gatekeeper、Gatekeeper ConstraintTemplate、Gatekeeper Constraint 物件
```
sh script/setup.sh
```

部署一個 image 來源為非法的 Pod
```
oc apply -f yaml/nginx-disallowed.yaml
```

可以發現因為不符合 policy 導致部署失敗
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/05_gatekeeper_requireprobe/img/01.png)  

回到 ACM 介面，可以發現其中檢查用的 Policy 也同時變成 violation 狀態
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/05_gatekeeper_requireprobe/img/02.png)  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/05_gatekeeper_requireprobe/img/03.png) 

部署一個 image 來源為合法的 Pod
```
oc apply -f yaml/nginx-allowed.yaml
```
