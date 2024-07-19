# OCPV Load Balance with Route, Serivce

用 OCPV Catalog 啟動一個 Fedora VM，並在 vm 上安裝 git
```bash
sudo dnf install git -y
```

Clone git repo
```bash
git clone https://github.com/CCChou/OpenShift-PoC-Scenario.git
```

切換目錄
```bash
cd OpenShift-PoC-Scenario/09_Virtualization/01_lb
```

複製 service 檔案至路徑下
```bash
sudo cp webserver/server.service /etc/systemd/system/
```

Reload 讓 systemd 讀取到新註冊服務
```bash
sudo systemctl daemon-reload
```

啟用 server.service
```bash
sudo systemctl enable server.service --now
```

透過 UI 建立 service 和 route 後可透過以下腳本持續測試
```bash
./curl.sh [route_url]
```

Clone 既有 VM 並給定新標籤後開機，切換至 script 部分查看是否有自動註冊並分擔負載
