# OpenShift kustomize gitops deployment

## 環境資訊
  * OpenShift version 4.12
  * OpenShift GitOps version 1.9

部署框架說明：
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/02_spring_gitops_deploy/image/kustomize_structure.png)

## 基本 gitops 範例

### 創建範例 App 應用 Project
  * 輸入欲創建的 project 名稱；範例如下
  ```
  ./create_project.sh demo-gitops
  ```

### 透過 ArgoCD 建立 Application
  * 透過 New App 建立 Application

  * 透過 yaml 路徑的 bgd-application.yaml 建立 ArgoCD Application

## applicationset 範例

### 創建範例 App 應用 Project
  * 輸入欲創建的 project 名稱；範例如下
  ```
  ./create_project.sh demo-gitops
  ```

### 透過 ArgoCD 建立 Application
  * 透過 New App 建立 Application

  * 透過 yaml 路徑的 applicationset.yaml 建立多個 ArgoCD Application

## gitops sync wave 範例

### 創建範例 App 應用 Project
  * 輸入欲創建的 project 名稱；範例如下
  ```
  ./create_project.sh demo-gitops-wave
  ```

### 透過 ArgoCD 建立 Application
  * 透過 New App 建立 Application

  * 透過 yaml 路徑的 todo-application.yaml 建立 ArgoCD Application

## gitops kustomize 範例

### 創建範例 App 應用 Project
  * 輸入欲多個 project 名稱，作為多環境情境；範例如下
  ```
  ./create_project.sh demo-kustomize-base
  ./create_project.sh demo-kustomize-dev
  ./create_project.sh demo-kustomize-test
  ./create_project.sh demo-kustomize-production
  ```

### 透過 ArgoCD 建立 Application
  * 透過 New App 建立不同環境的 Application

  * 透過 yaml 路徑的 kustomize-base-application.yaml 建立 ArgoCD Application
  * 透過 yaml 路徑的 kustomize-dev-application.yaml 建立 ArgoCD Application
  * 透過 yaml 路徑的 kustomize-test-application.yaml 建立 ArgoCD Application
  * 透過 yaml 路徑的 kustomize-prod-application.yaml 建立 ArgoCD Application