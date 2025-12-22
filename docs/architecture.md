# Architecture Overview

## Hybrid Storage Solution

This lab demonstrates a professional hybrid storage architecture with Azure Blob Storage as the primary cloud target.

### Components

- **On-prem Storage**: MinIO S3-compatible object storage
- **Primary Cloud**: Azure Blob Storage
- **Sync Tool**: rclone for bidirectional synchronization
- **Future DR**: Optional AWS S3 disaster recovery (greyed out)

### Data Flow

```
MinIO (on-prem) ⇄ Azure Blob (primary)
                      ↓
                 AWS S3 (future DR)
```

### Benefits

- Enterprise-grade cloud primary storage
- On-prem resilience and low-latency access
- Bidirectional sync capabilities
- Security baseline with encryption and least privilege
- Reproducible with Docker and scripts

### Diagram

See `diagrams/architecture-v1.png` for visual representation.
