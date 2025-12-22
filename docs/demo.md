# Demo Flow

This demo showcases the hybrid storage synchronization between MinIO on-prem and Azure Blob primary storage.

## Prerequisites

1. MinIO running locally (`docker compose up -d`)
2. Azure Storage Account and Container created
3. rclone configured with MinIO and Azure remotes
4. Test file uploaded to MinIO bucket

## Demo Steps

### 1. Initial State

- File exists in MinIO `onprem-storage` bucket
- Azure `hybrid-storage-lab` container is empty

### 2. Sync to Azure

Run the sync script:

```bash
./scripts/rclone/sync_to_azure.sh
```

**Expected**: File appears in Azure container

### 3. Verify Sync

Check both sides:

```bash
./scripts/rclone/verify.sh
```

Both should show 1 object.

### 4. Simulate Data Loss

Delete the file from MinIO bucket via the console.

### 5. Restore from Azure

Run the restore script:

```bash
./scripts/rclone/sync_from_azure.sh
```

**Expected**: File reappears in MinIO bucket

### 6. Final Verification

Run verify script again - both sides should have the file.

## What This Demonstrates

- Bidirectional hybrid storage sync
- Azure as primary cloud storage
- On-prem resilience and restore capabilities
- Professional sync tooling with rclone
- Automated scripts for repeatable operations

## Troubleshooting

- Ensure rclone config is correct
- Check network connectivity to Azure
- Verify MinIO is running and accessible
- Confirm bucket/container names match scripts
