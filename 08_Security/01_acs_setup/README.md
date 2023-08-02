# ACS Deploy

## 環境
1. OpenShift 4.12
2. ACS 4.1

## 使用指引

部署 ACS
```
sh script/setup.sh
```

取得 admin 登入密碼
```
sh script/getpwd.sh
```

登入 ACS 並點選 Platform Configuration -> Integration -> Cluster Init Bundle
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/08_Security/01_acs_setup/img/01.png)  

選擇 Generate bundle
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/08_Security/01_acs_setup/img/02.png)  

輸入名稱並點擊 Generate
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/08_Security/01_acs_setup/img/03.png)  

選擇 Download Kubernetes secrets file
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/08_Security/01_acs_setup/img/04.png)  

Apply 下載好的 secret
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/08_Security/01_acs_setup/img/05.png)  

建立 Secured Cluster 物件  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/08_Security/01_acs_setup/img/06.png)  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/08_Security/01_acs_setup/img/07.png)  
