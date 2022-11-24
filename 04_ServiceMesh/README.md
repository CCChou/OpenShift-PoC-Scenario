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

找到 istio-ingress-gateway 的 URL 便可以連線至 bookinfo 頁面
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/07.jpg)
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/08.jpg)

找到 Kiali 的 URL 打開 Kiali 頁面查看目前網格內的拓樸圖
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/09.jpg)
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/10.jpg)

## 藍綠部署
---

透過 VirtualService 調整流量導向哪個服務
```
oc apply -f 04_ServiceMesh/yaml/02_bluegreen.yml
```

透過 Kiali 可以觀察到流量切換的情況
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/11.jpg)

## 金絲雀部署
---

透過 VirtualService 調整流量導向權重
```
oc apply -f 04_ServiceMesh/yaml/03_canary.yml
```

透過 Kiali 可以觀察到流量分配的狀態
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/12.jpg)

## AB 測試
---

透過 VirtualService 調整路由規則，讓某些使用者導向測試用頁面
```
oc apply -f 04_ServiceMesh/yaml/04_abtesting.yml
```

連線到 bookinfo 頁面並登入使用者
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/13.jpg)

透過 Kiali 可以觀察到不同使用者導向的狀態
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/11.jpg)

## Tracing
---

從 Kiali 介面可以開啟 Jaeger
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/14.jpg)

在 Jaeger 介面可搜尋特定服務的請求蹤跡
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/15.jpg)

透過此頁面可以查看到請求經過哪些服務，並且花費的時間，讓開發人員進一步地對應用系統進行除錯和優化
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/img/16.jpg)