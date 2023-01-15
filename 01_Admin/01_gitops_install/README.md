# GitOps 維運管理

## 環境
1. OpenShift 4.10

## 安裝

安裝 GitOps Operator
```
oc apply -f yaml/operator_deploy.yaml
```

檢查安裝狀態
```
oc get po -n openshift-gitops
```

取得登入密碼
```
oc get secret openshift-gitops-cluster -n openshift-gitops -ojsonpath='{.data.admin\.password}'|base64 -d
```
> 帳號為 admin，另外也可以選擇採用 OAuth 方式登入

建立 Ｇroup
```
oc apply -f yaml/gitops_group.yaml
```

替 gitops-admin 群組加上 admin 權限
```
oc edit argocd openshift-gitops -n openshift-gitops
```
```
metadata
...
...
  rbac:
    policy: 'g, gitops-admin, role:admin'
    scopes: '[groups]'
```

## 進階設定

TODO
1. SSO using Keycloak and Dex
2. Resource Quota
3. ...etc