# Service Mesh 金絲雀部署

## 環境
1. OpenShift 4.10
2. Service Mesh 2.3

## 部署

設定初始權重 10%
```
oc apply -f yaml/canary_10.yaml
```

呼叫測試腳本
```
sh scripts/test.sh
```

更新權重至 50%
```
oc apply -f yaml/canary_50.yaml
```

呼叫測試腳本
```
sh scripts/test.sh
```

更新權重至 100%，完全將流量切換過去
```
oc apply -f yaml/canary_100.yaml
```

呼叫測試腳本
```
sh scripts/test.sh
```