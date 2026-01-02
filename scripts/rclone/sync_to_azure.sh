#!/usr/bin/env bash
set -euo pipefail

command -v rclone >/dev/null 2>&1 || {
	echo "Error: rclone is not installed or not on PATH." >&2
	exit 1
}

MINIO_BUCKET="${MINIO_BUCKET:-onprem-storage}"
AZ_CONTAINER="${AZ_CONTAINER:-hybrid-storage-lab}"

echo "Sync MinIO -> Azure Blob (primary)..."
rclone sync "minio:${MINIO_BUCKET}" "azure:${AZ_CONTAINER}" --progress
echo "Done."
