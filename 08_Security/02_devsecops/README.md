# DevSecOps with ACS

## 環境
1. OpenShift 4.12
2. ACS 4.1

流程說明：
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/08_Security/02_devsecops/image/devsecops_flow_introduction.png)

## 使用指引
建立新 project
```
oc new-project pipeline-demo
```

設定 container registry credential
```
sh scripts/createcred.sh [registry_url] [username] [password]
```

建立 pipeline 相關物件
```
oc apply -f yaml/
```

建立 rox api token 並 patch
```
sh scripts/createroxtoken.sh
```

使用 tkn cli 觸發流水線
```
tkn pipeline start build-and-deploy -w name=images-url,secret=container-registry-secret -w name=shared-workspace,claimName=source-pvc -p deployment-name=pipelines-vote-api -p git-url=https://github.com/openshift/pipelines-vote-api.git -p IMAGE=quay.io/rhtw/vote-api --showlog
```
