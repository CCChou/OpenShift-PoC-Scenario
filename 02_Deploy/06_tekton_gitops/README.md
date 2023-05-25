# Tekton GitOps

## 環境
OpenShift 4.12
Pipeline 1.10.2
GitOps 1.8.3
<br/>

## 設定
建立新專案
```
oc new-project caj-fare
```

設定 container registry credential
```
sh createcred.sh [registry_url] [username] [password]
```

設定 ArgoCD controller 權限
```
oc adm policy add-role-to-user admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller -n caj-fare
```

Apply pipeline 與 argo cd application 相關 yaml
```
oc apply -f yaml/
```