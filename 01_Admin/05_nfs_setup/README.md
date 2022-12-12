# NFS 設定

## 環境
1. OpenShift 4.10.36
2. NFS CSI Driver v4.1.0

## 安裝

安裝 nfs server
```
sh scripts/install-nfs-server.sh
```

安裝 nfs csi driver
```
sh scripts/install-driver.sh
```

設定 storageclass
```
sh scripts/install-sc.sh
```

## 部署測試範例

## Reference
1. [NFS CSI Driver](https://github.com/kubernetes-csi/csi-driver-nfs)