# OpenShift plus ACM gitops argocd deployment

# 環境資訊
  * OpenShift version 4.14
  * OpenShift GitOps version 1.11
  * ACM version 2.9

# 前置作業

1. 安裝 ACM
2. 於 local-cluster 安裝 openshift gitops operator
3. Import 受管叢集，命名 remote-ocp

# 使用指引

建立 ACM 叢集管理相關配置
```bash
./script/setup.sh
```

建立 GitOps 相關配置
```bash
./script/setgitopsconfig.sh
```

部署多叢集服務
```bash
oc apply -f ./yaml/applicationset.yaml
```