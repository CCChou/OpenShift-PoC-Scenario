# 網路存取管理

## 環境資訊
1. OpenShift 4.10

## 部署

部署基本驗證用服務
```
oc apply -f yaml/demo01.yaml -f yaml/demo02.yaml
```

驗證初始時兩個 project 網路是相通的
```
oc exec [pod_name] -- ping -c 5 [pod_ip]
```

部署 NetworkPolicy 讓外部服務無法連線至 npdemo02 的服務
```
oc apply -f networkpolicy-deny.yaml
```

驗證 npdemo02 網路已無法正常存取
```
oc exec [pod_name] -- ping -c 5 [pod_ip]
```
