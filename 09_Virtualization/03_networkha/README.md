# OpenShift Virtualization VM Network HA

使用 Node Problem Detector 搭配 Node Health Check Operator 來客製化節點 HA 機制，此範例主要是以 VM 額外的 Bridge 網段失效後可偵測到問題並自動進行 Remediation

## 環境資訊
- OpenShift 4.18.20
- OpenShift Virtualization 4.18.0
- Node Health Check Operator 0.10.1
- Self Node Remediation Operator 0.11.0
- Node Problem Detector 0.8.19

## 元件與機制說明
TODO 缺圖 (元件關係與 flow)

| 檔案名稱 | 說明 |
| - | - |
| node-problem-detector.yaml | 以 daemonset 形式部署 npd 管理元件 | 
| node-problem-detector-config.yaml | 定義 custom plugin 的參數，包含檢查規則 script、檢查間隔、客製 Condition 等資訊 |
| node-problem-detector-plugin.yaml | 定義客製檢查規則，此範例是檢查名稱為 br-flat 的 nic 是否失去物理訊號，是實際環境需要自行調整規則與名稱 |


## 環境設定
部署 npd daemonset
```yaml
oc apply -f yaml/node-problem-detector.yaml -f yaml/node-problem-detector-config.yaml -f yaml/node-problem-detector-plugin.yaml -f yaml/rbac.yaml
```

## 展示流程
當 NPD 建立完畢後可檢查節點 Condition 是否有新增 VMNetworkProblem 欄位
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/09_Virtualization/03_networkha/img/01.png)

建立 NodeHealthCheck
- TODO 缺圖

設定 Custom Type Condition 名稱為 VMNetworkProblem
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/09_Virtualization/03_networkha/img/02.png)

設定 Status 為 True 並調整 Duration 至合適數值
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/09_Virtualization/03_networkha/img/03.png)

點擊 Create 建立檢查規則
- TODO 缺圖