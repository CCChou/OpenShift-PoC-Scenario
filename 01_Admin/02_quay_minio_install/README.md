# Quay 安裝

使用 MinIO 作為 Object Storage 來安裝 Quay

## Install MinIO

安裝 MinIO Operator
... pic ...

建立 Tenant
```

```
>  此步驟前先確認有無 storage 可供使用

建立 Bucket
```

```

## Install Quay

安裝 Quay Operator
... pic ...

根據 config.yaml 建立 secret 
```
oc create secret generic -n quay-enterprise --from-file config.yaml=./config.yaml init-config-bundle-secret
```

```
DISTRIBUTED_STORAGE_CONFIG: 
  default: 
    - RadosGWStorage 
    - access_key: access_key_here 
      secret_key: secret_key_here 
      bucket_name: bucket_name_here 
      hostname: hostname_here 
      is_secure: true
      port: 443
      storage_path: /datastorage/registry 
DISTRIBUTED_STORAGE_DEFAULT_LOCATIONS: [] 
DISTRIBUTED_STORAGE_PREFERENCE: 
    - default
```

建立 QuayRegistry CR
```

```

取得

Push image 驗證 quay 功能是否正常
```

```

## Quay 維運管理
