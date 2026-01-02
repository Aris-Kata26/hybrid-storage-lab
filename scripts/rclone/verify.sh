#!/usr/bin/env bash
set -euo pipefail

command -v rclone >/dev/null 2>&1 || {
	echo "Error: rclone is not installed or not on PATH." >&2
	exit 1
}

MINIO_BUCKET="${MINIO_BUCKET:-onprem-storage}"
AZ_CONTAINER="${AZ_CONTAINER:-hybrid-storage-lab}"

echo "MinIO objects:"
rclone ls "minio:${MINIO_BUCKET}" | wc -l

echo "Azure objects:"
rclone ls "azure:${AZ_CONTAINER}" | wc -l

echo "Tip: run 'rclone lsl' on both sides to compare sizes/timestamps."
