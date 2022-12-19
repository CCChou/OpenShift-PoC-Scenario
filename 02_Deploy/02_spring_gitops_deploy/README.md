# OpenShift kustomize gitops deployment

# 環境資訊
  * OpenShift version 4.10
  * OpenShift GitOps version 1.6
  * App rumtime: spring boot

# 創建範例 Spring App 應用 Project
  * 輸入欲創建的 project 名稱；範例如下
  ```
  ./create_project.sh spring-petclinic
  ```

# 透過 ArgoCD 建立 Application
  * 透過 New App 建立 Application

  * 透過 application.yaml 建立 ArgoCD Application