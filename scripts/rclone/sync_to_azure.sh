#!/usr/bin/env bash
set -euo pipefail

MINIO_BUCKET="onprem-storage"
AZ_CONTAINER="hybrid-storage-lab"

echo "Sync MinIO -> Azure Blob (primary)..."
rclone sync "minio:${MINIO_BUCKET}" "azure:${AZ_CONTAINER}" --progress
echo "Done."
