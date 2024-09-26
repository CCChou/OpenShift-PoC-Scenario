# 環境資訊

1. OpenShift version 4.15
2. OpenShift pipeline version 1.14
3. NVIDIA GPU operaotr version 23.9
4. Node feature discovery operator version 4.15
5. OpenShift AI 2.8

# 前置作業

1. 安裝 openshift pipeline operator
2. 安裝 NVIDIA GPU operator
3. 安裝 Node feature discovery operator
4. 安裝 openShift AI operator

# 使用 machineset 建立 GPU 資源 (AWS為例)

參數1 machineset node 數 (預設2)
參數2 gpu 節點選型 (預設 g5.4xlarge)，選擇參考 https://docs.aws.amazon.com/dlami/latest/devguide/gpu.html
```bash
./script/gpu-machineset.sh
```

# 部署及驗證

建立 node feature discovery instance 並確認 instance；應建立 nfd-controller-manager * 1, nfd-master * 1, nfd-worker * 3
```bash
oc apply -f ./yaml/openshift-nfd.yaml

oc get pods -n openshift-nfd
```

建立 gpu cluster policy 並確認 status 是 ready
```bash
oc apply -f ./yaml/default-gpu-cluster-policy.yaml -n nvidia-gpu-operator

oc get clusterpolicy -n nvidia-gpu-operator
```

建立 data science cluster，並確認所有 pods 都在 running status
```bash
oc apply -f ./yaml/default-dsc.yaml -n redhat-ods-applications

oc get pods -n redhat-ods-applications
```

將 user 加入 rhods-admins 權限
```bash
export USER1=[user1]
export USER2=[user2]

oc adm groups add-users rhods-admins ${USER1} ${USER2}

# view dashboard permission
oc get odhdashboardconfigs odh-dashboard-config -n redhat-ods-applications -o yaml
```

建立 data science project
```bash
export DSPROEJCT=[myproject]

oc create namespace $DSPROEJCT
oc label namespace $DSPROEJCT opendatahub.io/dashboard='true' modelmesh-enabled='true'
```

# 建立 custom workbench image
建立 custom notebook image
```bash
git clone https://github.com/opendatahub-io-contrib/workbench-images.git
```

調整 Dashboard 可選擇之 notebook size
```bash
oc get OdhDashboardConfig -n redhat-ods-applications
```

建立 custom notebook image (參考 quay.io/modh/cuda-notebooks 的 base image)；使用自己的 quay repo
```bash
export CUSTOM_IMAGE_NAME=[my-custom-image]
export QUAY_REPO=[my-quay-repo]

podman build -t ${CUSTOM_IMAGE_NAME} ./custom-image

podman login quay.io

podman push ${CUSTOM_IMAGE_NAME}:latest quay.io/${QUAY_REPO}/${CUSTOM_IMAGE_NAME}
```
