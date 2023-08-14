# HPA 自動擴展

## 環境
1. OpenShift 4.12

## 使用指引
建立 hpa 測試用專案
```
oc new-project hpa-demo
```

部署應用與擴展設定
```bash
oc apply -f yaml/cpu_based_deployment.yaml
oc apply -f yaml/cpu_based_hpa.yaml
```

呼叫以下指令執行 benchmark 測試
```
sh script/benchmark.sh
```

查看 scaling 狀況
```bash
watch oc get po
```