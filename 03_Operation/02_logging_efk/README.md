# 日誌情境展示

## 環境資訊
1. OpenShift 4.12
2. Logging 5.7

## 安裝 ClusterLogging
先行安裝好 OpenShift Elasticsearch Operator 和 Red Hat OpenShift Logging Operator  

執行 setup.sh 腳本建立 ClusterLogging 相關物件
```
sh script/setup.sh
```

## Kibana Dashboard

日誌索引分為 infra、app、audit 三種，並可以在 Kibana 介面上透過 index pattern 將之彙整呈現  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/03_Operation/02_logging_efk/img/01.png)  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/03_Operation/02_logging_efk/img/02.png)  

可以透過欄位搜尋各 project 下部署的應用日誌
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/03_Operation/02_logging_efk/img/03.png)  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/03_Operation/02_logging_efk/img/04.png)  

也可以透過欄位搜尋 node 上的系統日誌如 kubelet
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/03_Operation/02_logging_efk/img/05.png)  
![](https://github.com/CCChou/OpenShift-PoC-Scenario/blob/main/03_Operation/02_logging_efk/img/06.png)  
