# 環境資訊

1. OpenShift version 4.14
2. OpenShift pipeline version 1.13

# 前置作業

1. 安裝 openshift pipeline operator
2. 確認 API 及 service account 存在
   ```
   oc api-resources --api-group=tekton.dev
   oc get serviceaccount pipeline
   ```
3. 安裝 tkn CLI

# 部署及驗證

設定 PROJECT_NAME 環境變數
```
export PROJECT_NAME=[project_name]
```

建立 pipeline 相關物件
```
sh script/setup.sh ${PROJECT_NAME}
```

透過 tkn CLI 執行 pipeline 建置後端 api 程式
```
tkn pipeline start build-and-deploy \
    -w name=shared-workspace,claimName=source-pvc \
    -p git-revision=master \
    -p deployment-name=pipelines-vote-api \
    -p git-url=https://github.com/openshift/pipelines-vote-api.git \
    -p IMAGE=image-registry.openshift-image-registry.svc:5000/${PROJECT_NAME}/vote-api \
    --showlog
```

透過 tkn CLI 執行 pipeline 建置前端 ui 程式
```
tkn pipeline start build-and-deploy \
    -w name=shared-workspace,claimName=source-pvc \
    -p git-revision=master \
    -p deployment-name=pipelines-vote-ui \
    -p git-url=https://github.com/openshift/pipelines-vote-ui.git \
    -p IMAGE=image-registry.openshift-image-registry.svc:5000/${PROJECT_NAME}/vote-ui \
    --showlog
```