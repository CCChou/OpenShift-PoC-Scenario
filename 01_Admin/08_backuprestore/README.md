# Backup and Restore using OADP

## 環境
1. OpenShift 4.14

## 安裝

```bash
oc new-project wordpress
oc apply -n wordpress -k ./
oc expose service wordpress -n wordpress
```

```bash
oc create secret generic cloud-credentials -n openshift-adp \
--from-file cloud=credentials-velero
```

```bash
oc patch volumesnapshotclass ocs-external-storagecluster-rbdplugin-snapclass --type=merge -p '{"deletionPolicy": "Retain"}'
oc label volumesnapshotclass ocs-external-storagecluster-rbdplugin-snapclass velero.io/csi-volumesnapshot-class="true"
```

## Reference
1. [yortch/oadp](https://github.com/yortch/oadp.git)
