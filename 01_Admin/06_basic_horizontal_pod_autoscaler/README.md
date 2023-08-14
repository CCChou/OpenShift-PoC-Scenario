# HPA 自動擴展

## 環境
1. OpenShift 4.12

## 使用指引
部署應用與擴展設定
```bash
oc apply -f yaml/cpu_based_deployment.yaml
oc apply -f yaml/cpu_based_hpa.yaml
```

切換至 terminal 呼叫以下指令
```
sysbench cpu --time=30 run
```

TODO