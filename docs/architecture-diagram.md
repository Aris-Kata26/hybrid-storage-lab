```mermaid
flowchart LR
    subgraph OnPrem
        M[MinIO Bucket: onprem-storage]
    end
    subgraph AzureCloud
        A[Azure Blob Container: hybrid-storage-lab]
    end
    subgraph FutureDR
        S[AWS S3 (optional)]
    end

    M <--> A:::primary
    A --> S:::dr

    classDef primary fill:#00a3ff,stroke:#0367a6,color:#fff
    classDef dr fill:#999,stroke:#666,color:#fff

%% Notes
%% rclone remotes used:
%% - minio:onprem-storage
%% - azure:hybrid-storage-lab
```
