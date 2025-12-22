# Hybrid Storage Lab: Azure Primary

Professional hybrid storage solution with MinIO on-prem and Azure Blob as primary cloud storage.

## Architecture

- On-prem: MinIO S3-compatible storage
- Cloud: Azure Blob Storage (primary)
- Sync: rclone for bidirectional synchronization

## Quick Start

1. Start MinIO: `docker compose up -d`
2. Configure Azure Storage Account and Container
3. Set up rclone configuration
4. Run sync scripts

## Documentation

- [Architecture](docs/architecture.md)
- [Local Setup](docs/setup-local.md)
- [Azure Setup](docs/setup-azure.md)
- [Demo](docs/demo.md)
- [Security](docs/security.md)

## Scripts

- `scripts/rclone/sync_to_azure.sh` - Sync from MinIO to Azure
- `scripts/rclone/sync_from_azure.sh` - Restore from Azure to MinIO
- `scripts/rclone/verify.sh` - Verify sync status

## Demo Flow

1. Upload file to MinIO bucket
2. Run sync to Azure
3. Verify file in Azure
4. Delete file from MinIO
5. Run restore from Azure
6. Verify file back in MinIO
