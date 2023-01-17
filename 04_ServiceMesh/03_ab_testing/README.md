# Service Mesh AB Testing

## 環境
1. OpenShift 4.10
2. Service Mesh 2.3

## 部署

Apply AB Testing 設定
```
oc apply -f yaml/ab_testing.yaml
```

先登入再呼叫 API
```
sh scripts/test_with_login.sh
```
> 流量會導向 v2

單純呼叫 API
```
sh scripts/test.sh
```
> 流量會導向 v3