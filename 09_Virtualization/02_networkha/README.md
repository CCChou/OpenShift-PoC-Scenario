# OpenShift Virtualization VM Network HA

使用 Node Problem Detector 搭配 Node Health Check Operator 來客製化節點 HA 機制，此範例主要是以 VM 額外的 Bridge 網段失效後可偵測到問題並自動進行 Remediation

## 環境資訊
- OpenShift 4.18.20
- OpenShift Virtualization 4.18.0
- Node Health Check Operator 0.10.1
- Self Node Remediation Operator 0.11.0
- Node Problem Detector 0.8.19

## 環境設定
部署 npd daemonset
```yaml
oc apply -f yaml/node-problem-detector-config.yaml -f node-problem-detector-config.yaml -f node-problem-detector-plugin.yaml -f rbac.yaml
```

## 展示流程
設定 Custom Type Condition 名稱為 VMNetworkProblem
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/09_Virtualization/02_networkha/img/02.jpg)

設定 Status 為 True 並調整 Duration 至合適數值
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/09_Virtualization/02_networkha/img/02.jpg)
