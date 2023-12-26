# OpenShift custom HPA

# 環境資訊
1. OpenShift 4.14
2. Custom Metrics Autoscaler Operator 2.11

## 使用指引

建立專案及應用相關配置
```bash
./script/setup.sh
```

建立 keda CR 物件
```bash
./script/createkeda.sh
```

更新 thanos token
```bash
./script/patchtoken.sh
```

打腳本測試流量
```bash
oc create -f ./yaml/load.yaml -n keda-demo
```

