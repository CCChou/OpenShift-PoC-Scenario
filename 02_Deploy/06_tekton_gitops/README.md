# CICD with Tekton and Argo CD

## 環境
1. OpenShift 4.14
2. Pipeline 1.13.1
3. GitOps 1.11.0

流程說明：
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/06_tekton_gitops/image/pipeline_flow_introduction.png)

## 設定

建立新專案
```
oc new-project caj-fare
```

設定 container registry credential
```
sh scripts/createcred.sh [registry_url] [username] [password]
```

設定 git credentials
```
oc create secret generic git-cred --from-file=id_rsa=[ssh_private_file_path]
```

設定 ArgoCD controller 權限
```
oc adm policy add-role-to-user admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller -n caj-fare
```

Apply pipeline 與 argo cd application 相關 yaml
```
oc apply -f yaml/pipelines
```

## 情境展示
1. 設定好後會有一個完整的 pipeline  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/06_tekton_gitops/image/pipeline.png)


2. 執行任務

    a. 可透過 UI 點選 Start 並輸入參數後執行 pipeline 任務  
    ![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/06_tekton_gitops/image/pipelinerun-1.png)
    ![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/06_tekton_gitops/image/pipelinerun-2.png)
    > 1. **APP_NAME:** caj-fare
    > 2. **SOURCE_GIT_URL:** https://github.com/CCChou/caj-fare.git
    > 3. **SOURCE_GIT_REVISION:** main
    > 4. **DOCKERFILE:** Dockerfile-openjdk
    > 5. **IMAGE:** quay.io/rhtw/caj-fare
    > 6. **manifest-git-url:** 'https://[user_name]:[user_token]@github.com/CCChou/caj-fare-deploy.git'
    > 7. **manifest-git-revision:** main
    > 8. **manifest-path:** gitops/deployment.yaml
    > 9. **app-source:** 選擇 PersistentVolumeClaim 並選擇 caj-fare-pipeline-pvc
    > 10. **images-url:** 選擇 Secret 並選擇 container-registry-secret
    > 11. **app-manifest:** 選擇 PersistentVolumeClaim 並選擇 manifest-pvc
    > 12. **git-cred:** 選擇 Secret 並選擇 git-cred

    b. 或是透過預先寫好的 PipelineRun 物件執行 pipeline 任務
    ```
    oc apply -f yaml/run/pipelinerun.yaml
    ```

3. 執行成功後可以觀察 registry 中上傳的 image 以及其 tag 名稱  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/06_tekton_gitops/image/quay.png)

4. 查看 manifest git repo 中的 deployment.yaml 的 image 欄位有更新與 registry 中一致  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/06_tekton_gitops/image/deployment-1.png)

5. 最後檢查 project 下的 deployment 是否也更新為最新版本的 image  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/06_tekton_gitops/image/deployment-2.png)
