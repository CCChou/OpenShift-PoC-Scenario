# NFS 設定

## 環境
1. OpenShift 4.12
2. NFS CSI Driver v4.1.0

## 安裝

安裝 nfs server
```
sh script/install-nfs-server.sh
```

安裝 nfs csi driver
```
sh script/install-driver.sh
```

設定 storageclass
```
sh script/install-sc.sh
```

## 部署測試範例

部署應用確保 NFS StorageClass 可以正常掛載
```
oc apply -f yaml/pod.yaml
```

檢查掛載狀態
```
oc exec test -- df -h
```

## Reference
1. [NFS CSI Driver](https://github.com/kubernetes-csi/csi-driver-nfs)