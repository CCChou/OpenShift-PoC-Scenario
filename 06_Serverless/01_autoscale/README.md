# Serverless 自動擴展

## 環境資訊
1. OpenShift 4.10
2. [hey](https://github.com/rakyll/hey)

## 部署與展示

部署範例應用程式
```
oc apply -f yaml/kn-service.yaml
```

透過 scripts 進行壓測展示 serverless 自動擴展
```
./scripts/load-test.sh
```
