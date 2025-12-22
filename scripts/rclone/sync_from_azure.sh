#!/usr/bin/env bash
set -euo pipefail

MINIO_BUCKET="onprem-storage"
AZ_CONTAINER="hybrid-storage-lab"

echo "Restore Azure Blob -> MinIO..."
rclone sync "azure:${AZ_CONTAINER}" "minio:${MINIO_BUCKET}" --progress
echo "Done."
