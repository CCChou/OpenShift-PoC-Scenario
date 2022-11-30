# GitOps 維運管理

## 安裝

安裝 GitOps Operator
```
oc apply -f 01_operator_deploy.yml
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