# 服務網格 (Service Mesh)

可用於
1. 需要能採用進階部署策略
2. 需要能進行應用系統的流量追蹤

<br/>

## 基本設定
---

將要納管的 Project 加入 ServiceMeshMemberRolls 內
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/01.JPG)
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/02.JPG)
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/03.JPG)


部署 bookinfo 範例應用
```
oc apply -f 04_ServiceMesh/yaml/01_setup.yml
```


## 藍綠部署
---

```
oc apply -f 04_ServiceMesh/yaml/02_bluegreen.yml
```

## 金絲雀部署
---

```
oc apply -f 04_ServiceMesh/yaml/03_canary.yml
```

## AB 測試
---

```
oc apply -f 04_ServiceMesh/yaml/04_abtesting.yml
```
