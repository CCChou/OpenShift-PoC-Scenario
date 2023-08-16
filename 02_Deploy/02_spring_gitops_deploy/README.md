# OpenShift kustomize gitops deployment

## 環境資訊
  * OpenShift version 4.12
  * OpenShift GitOps version 1.9
  * App: Quarkus

部署框架說明：
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/02_spring_gitops_deploy/image/kustomize_structure.png)

## 創建範例 Spring App 應用 Project
  * 輸入欲創建的 project 名稱；範例如下
  ```
  ./create_project.sh quarkus-hello
  ```

## 透過 ArgoCD 建立 Application
  * 透過 New App 建立 Application

  * 透過 application.yaml 建立 ArgoCD Application
