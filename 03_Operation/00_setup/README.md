# 安裝與設定

## 環境資訊

OpenShift 4.10
Logging 5.5

## 安裝

建立 ＣlusterLogging 物件
```
oc apply -f yaml/clusterlogging.yaml
```
> 請自行視需求調整 YAML 檔案內設定，例如 storageclass 名稱

<br/>

部署 event router 
```
oc process -f yaml/eventrouter.yaml | oc apply -n openshift-logging -f -
```