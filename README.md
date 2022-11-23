# OpenShift-PoC-Scenario

基於常見驗證項目彙整成以下幾個場景
1. [管理者功能](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/01_Admin/README.md)
2. [部署功能](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/02_Deploy/README.md)
3. [維運功能](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/03_Operation/README.md)
4. [Service Mesh](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/04_ServiceMesh/README.md)
5. [叢集管理](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/05_ClusterManagement/README.md)

## Reference
1. [PoC workshop](https://docs.google.com/spreadsheets/d/1XZHA6xIQ2gUoFnJQGovY5RXVhrRqFDFq-jzra3Rdzic/edit?usp=sharing)


Openshift PoC
===
###### tags: `Openshift` `DevOps` `PoC`
撰寫日期 : 2022 / 10 / 18

- 目錄
[ToC]

## 學習網址

- 參考來源

| Features          | Tutorials                  |
| ----------------- |:-----------------------    |
| S2i Lab GitHub    | [:link:][S2i Lab GitHub]   |
| BackUp            | [:link:][BackUp]           |

[S2i Lab GitHub]: https://github.com/CCChou/s2i-lab.git
[BackUp]: https://www.google.com/
![](https://i.imgur.com/gAsxWYy.png)

- JBOSS EAP IMAGE : docker.io/georgechiu/cicd2
- PING IMAGE : docker.io/georgechiu/cyp:v1
## 1: 管理者功能
### A. Project 與使用者管理
#### 1.A.1: 建立Project 來展示資源隔離功能
-- 建立Project名稱Demo01跟Demo02 
1. Create Project
![](https://i.imgur.com/CgqHSAq.png)
2. 填入資訊
![](https://i.imgur.com/Jkygtek.png)
3. 查看建立的Project
![](https://i.imgur.com/ARggZdE.png)
-- 在Demo01建立pod01，在Demo02建立pod02
4. 使用pod-example01.yaml及pod-example02.yaml分別部屬在demo01及demo02
![](https://i.imgur.com/xuHSpm8.png)
![](https://i.imgur.com/U9buAgw.png)
-- pod01 去ping pod02
![](https://i.imgur.com/ndpyKN2.png)
#### 1.A.2: 建立使用者展示Project based 的權限管理
-- 有兩組帳號 root 跟 palsys1
1. 查看Openshift中的帳號
![](https://i.imgur.com/m3a9mT6.png)
-- root 可查看 np (project)，但是palsys1沒有權限查看
![](https://i.imgur.com/zgpdNlp.png)
![](https://i.imgur.com/o3XA1K3.png)
### B. 資源管理
#### 1.B.1 透過 ResourceQuota 限制Pod上限數量
1. 使用Deployment建立3個POD
![](https://i.imgur.com/pfp2tgB.png)
![](https://i.imgur.com/YgeLbYq.png)

-- Administation ==> ResourceQutoas 建立example 
2. 建
![](https://i.imgur.com/75Ogxgn.png)
-- 回到demo01 建立pod發現無法一直擴展


#### 1.B.2 透過 LimitRange 限制CPU與Memory上限

-- 到demo02 建立LimitRange
![](https://i.imgur.com/hIygneI.png)

-- 建立一個pod不指定資源
![](https://i.imgur.com/JbsXYox.png)

-- 查看pod所使用的資源應為LimitRange相同
![](https://i.imgur.com/Du42vqx.jpg)

#### 1.B.3 部署應用驗證在設定資源上限的專案中需要給定合法資源設置不然會部署失敗
![](https://i.imgur.com/Jc8gNJ3.png)

### C. NetworkPolicy 
#### 1.C.1 建立NetWorkPolicy 展示只有同 project 內應用可互相存取
建立在demo01
## 2: 部署功能
### A. 開發者介面
#### 2.A.1 展示開發者介面的特點
![](https://i.imgur.com/HotYCzj.png)

### B. 支援各種部屬來源
#### 2.B.1 說明支援部屬方式
![](https://i.imgur.com/44WizGH.png)

#### 2.B.2 使用S2i(github)方式部屬一個應用程式
![](https://i.imgur.com/EeAiTFN.png)

建立在demo02
#### 2.B.3 展示Topology
### C. 提供對外服務
#### 1.C.1 延續上一個![](https://i.imgur.com/mXz5mKk.png)
情境，透過ROUTE驗證能連線至應用

### D. image 掃描
#### 2.D.1 展示Image Scan 功能
![](https://i.imgur.com/rdlifrh.png)
![](https://i.imgur.com/Pw9bJsl.png)

## 3: 維運功能
### A. 日誌
#### 3.A.1 使用Kibana介面展示統一日誌管理
![](https://i.imgur.com/Rjvqk8h.png)
![](https://i.imgur.com/WxAlP75.png)
![](https://i.imgur.com/EJwj5Tr.png)

#### 3.A.2 展示日誌搜尋功能
![](https://i.imgur.com/ZhYB77n.png)
![](https://i.imgur.com/USkwFEW.png)

#### 3.A.3 展示日誌內容說明
![](https://i.imgur.com/xSZwj2F.png)
![](https://i.imgur.com/fL4K0TE.png)

### B. 監控
#### 3.B.1 展示預設監控的Dashboard
![](https://i.imgur.com/ZFutUIQ.png)
![](https://i.imgur.com/pONK9go.png)
![](https://i.imgur.com/aGPhCTF.png)
![](https://i.imgur.com/j8Mwsps.png)
![](https://i.imgur.com/lkaqAA6.png)
![](https://i.imgur.com/bl2aq7l.png)

#### 3.B.2 展示Alert規則與通知設定
SMTP 轉發
![](https://i.imgur.com/zp91RS3.png)
![](https://i.imgur.com/nP1lJv1.png)
![](https://i.imgur.com/jmVrdpT.png)
![](https://i.imgur.com/zVvezi3.png)

## 4: Service Mesh
### A. 支援各種部屬策略
#### 4.A.1 使用VirtualService weight展示藍綠部屬與金絲雀部屬
#### 4.A.2 使用VirtualService match hader展示A/B Testing 
### B. 流量查看
#### 4.B.1 延續前一個情境，透過Kiali展示可是化流量功能
---
## 5: 叢集管理
### A. 統一介面管理多叢集
#### 5.A.1 透過ACM介面展示如何在單一介面管理多叢集
### B. 叢集升級
#### 5.B.1 延續上一個情境，使用ACM介面升級叢集，並展示叢集於升級過程中可正常運行




