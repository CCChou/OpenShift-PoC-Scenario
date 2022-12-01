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

```

建立 QuayRegistry CR
```

```

Push image 驗證 quay 功能是否正常
```

```

## Quay 維運管理
