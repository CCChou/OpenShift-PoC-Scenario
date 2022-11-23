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
