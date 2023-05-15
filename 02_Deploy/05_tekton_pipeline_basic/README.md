# 環境資訊

1. OpenShift 4.12

# 前置作業

1. 安裝 openshift pipeline operator
2. 確認 API 及 service account 存在
   ```
   oc api-resources --api-group=tekton.dev
   oc get serviceaccount pipeline
   ```
3. 安裝 tkn CLI

# 部署及驗證

建立 pipeline 部署 namespace
```
oc apply -f yaml/pipeline_demo_ns.yaml
```

建立 task、pipeline、pvc
```
oc apply -f yaml/basic_pipeline_all.yaml
```

透過 tkn CLI 建立 pipeline
```
tkn pipeline start build-and-deploy -w name=shared-workspace,claimName=source-pvc -p deployment-name=pipelines-vote-api -p git-url=https://github.com/openshift/pipelines-vote-api.git -p IMAGE=image-registry.openshift-image-registry.svc:5000/pipeline-demo/vote-api --showlog

tkn pipeline start build-and-deploy -w name=shared-workspace,claimName=source-pvc -p deployment-name=pipelines-vote-api -p git-url=https://github.com/openshift/pipelines-vote-api.git -p IMAGE=image-registry.openshift-image-registry.svc:5000/opentlc-mgr/vote-api --showlog
```