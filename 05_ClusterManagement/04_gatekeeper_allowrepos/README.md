# ACM with gatekeeper 限制 image 來源

## 環境
1. OpenShift 4.12
2. ACM 2.7

## 使用指引
呼叫 script 建立相關 policy，之後會由 policy 自動建立 Gatekeeper、Gatekeeper ConstraintTemplate、Gatekeeper Constraint 物件
```
sh scripts/setup.sh
```

部署一個 image 來源為非法的 Pod
```
oc apply -f yaml/nginx-disallowed.yaml
```

部署一個 image 來源為合法的 Pod
```
oc apply -f yaml/nginx-allowed.yaml
```
