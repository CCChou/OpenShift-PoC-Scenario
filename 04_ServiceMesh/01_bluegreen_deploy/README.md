# Service Mesh 藍綠部署

## 環境
1. OpenShift 4.10.36

## 部署

設定初始 blue 部署
```
oc apply -f yaml/blue_v2.yaml
```

測試流量導向 blue 部署
```
sh scripts/test.sh
```

切換成 green 部署
```
oc apply -f yaml/green_v3.yaml
```

測試流量導向 green 部署
```
sh scripts/test.sh
```