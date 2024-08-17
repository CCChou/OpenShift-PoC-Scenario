# DevSecOps with ACS

## 環境
1. OpenShift 4.16
2. OpenShift GitOps 1.13


## 使用指引

### 事前準備
1. 安裝 opnenshift-gitops operator
2. fork https://github.com/CCChou/OpenShift-PoC-Scenario.git
3. git clone https://github.com/CCChou/OpenShift-PoC-Scenario.git
4. cd 02_Deploy/08_argo_rollout

### 環境 setup

建立 gitops 及 rollout 所需環境
```bash
oc apply -f gitops/application-cluster-config.yaml
```

### 測試藍綠部署

建立 bluegreen 分支
```bash
git checkout -b bluegreen
git push origin bluegreen
```
修改 repo name 並建立藍綠部署 argo application
```yaml
spec:
  destination:
    namespace: gitops-blue-green
    server: "https://kubernetes.default.svc"
  project: default
  source:
    path: 02_Deploy/08_argo_rollout/app/shop-canary/overlays/rollout
    repoURL: "https://github.com/change_me/OpenShift-PoC-Scenario.git"
```

```bash
oc apply -f blue-green-rollouts/application-shop-blue-green.yaml
```

測試 API 接口
```bash
# product online API
curl -k "$(oc get routes products-umbrella-online -n gitops --template='https://{{.spec.host}}')/products" | jq;

# product offline API
curl -k "$(oc get routes products-umbrella-offline -n gitops --template='https://{{.spec.host}}')/products" | jq;
```

測試部署狀態
```bash
oc argo rollouts get rollout products -n gitops-blue-green

# 可持續監控部署狀態
oc argo rollouts get rollout products -n gitops-blue-green --watch 
```

修改 overlays/rollout 中的版本參數
```yaml
apiVersion: v1
data:
  application.version: v1.0.1 # change to v1.1.1
kind: ConfigMap
metadata:
  name: products-configmap-env-base
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  labels:
    app: products
  name: products
spec:
  template:
    spec:
      containers:
        - envFrom:
            - configMapRef:
                name: products-configmap-env
            - configMapRef:
                name: products-configmap-env-base
          image: "quay.io/dseveria/products:v1.0.1" # change to v1.1.1
          imagePullPolicy: Always
          livenessProbe:
            failureThreshold: 3
            httpGet:
              path: /q/health/live
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 0
            periodSeconds: 30
            successThreshold: 1
            timeoutSeconds: 10
          name: quarkus-base
          ports:
            - containerPort: 8080
              name: http
              protocol: TCP
          readinessProbe:
            failureThreshold: 3
            httpGet:
              path: /q/health/ready
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 0
            periodSeconds: 30
            successThreshold: 1
            timeoutSeconds: 10
          resources: {}
          securityContext: {}
```

將修改後的配置檔推送至 git
```bash
git add .
git commit -m "Change products version to v1.1.1"
git push origin bluegreen
```

啟動換版指令
```bash
oc argo rollouts promote products -n gitops-blue-green
```

若要執行 rollback，將 git commit revert 再 push 即可 (還是要啟動換版指令才能恢復到原版狀態)

### 測試金絲雀部署

建立 canary 分支
```bash
git checkout -b canary
git push origin canary
```

修改 repo name 並建立金絲雀部署 argo application
```yaml
spec:
  destination:
    namespace: gitops-blue-green
    server: "https://kubernetes.default.svc"
  project: default
  source:
    path: 02_Deploy/08_argo_rollout/app/shop-blue-green/overlays/rollout
    repoURL: "https://github.com/change_me/OpenShift-PoC-Scenario.git"
```

```bash
oc apply -f canary-rollouts/application-shop-canary.yaml
```

測試部署狀態
```bash
oc argo rollouts get rollout products -n gitops-canary

# 可持續監控部署狀態
oc argo rollouts get rollout products -n gitops-canary --watch
```

測試 API 接口
```bash
curl -k "$(oc get routes products-umbrella-online -n gitops --template='https://{{.spec.host}}')/products" | jq
```

修改 overlays/rollout 中的版本參數
```yaml
apiVersion: v1
data:
  application.version: v1.0.1 # change to v1.1.1
kind: ConfigMap
metadata:
  name: products-configmap-env-base
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  labels:
    app: products
  name: products
spec:
  template:
    spec:
      containers:
        - envFrom:
            - configMapRef:
                name: products-configmap-env
            - configMapRef:
                name: products-configmap-env-base
          image: "quay.io/dseveria/products:v1.0.1" # change to v1.1.1
          imagePullPolicy: Always
          livenessProbe:
            failureThreshold: 3
            httpGet:
              path: /q/health/live
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 0
            periodSeconds: 30
            successThreshold: 1
            timeoutSeconds: 10
          name: quarkus-base
          ports:
            - containerPort: 8080
              name: http
              protocol: TCP
          readinessProbe:
            failureThreshold: 3
            httpGet:
              path: /q/health/ready
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 0
            periodSeconds: 30
            successThreshold: 1
            timeoutSeconds: 10
          resources: {}
          securityContext: {}
```

將修改後的配置檔推送至 git
```bash
git add .
git commit -m "Change products version to v1.1.1"
git push origin canary
```

若要執行 rollback，將 version 改為 v1.0.1，並修改 rollout
```yaml
spec:
  strategy:
    canary:
      analysis:
        templates:
          - templateName: products-analysis-template
      steps:
        - setWeight: 100
```