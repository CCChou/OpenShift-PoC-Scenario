# Serverless 元件安裝與設定

## 環境資訊
1. OpenShift 4.10
2. Serverless 1.26

## 安裝

安裝 Serving
```
oc apply -f yaml/knative-serving.yaml
```

檢查安裝是否完成
```
./scripts/verify.sh
```

## Reference
1. [Pod-Autoscaling-Demo](https://github.com/CCChou/Pod-Autoscaling-Demo)