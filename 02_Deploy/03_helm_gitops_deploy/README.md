# OpenShift helm gitops deployment

# 環境資訊
  * OpenShift version 4.12
  * OpenShift GitOps version 1.9
  * helm version 3

# 部署及驗證

## 創建範例應用 Project
  * 輸入欲創建的 project 名稱；範例如下
  ```
  ./create_project.sh helm-demo
  ```

## 建立 argo application
  * 透過 UI apply /yaml/application.yaml