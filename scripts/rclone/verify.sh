#!/usr/bin/env bash
set -euo pipefail

MINIO_BUCKET="onprem-storage"
AZ_CONTAINER="hybrid-storage-lab"

echo "MinIO objects:"
rclone ls "minio:${MINIO_BUCKET}" | wc -l

echo "Azure objects:"
rclone ls "azure:${AZ_CONTAINER}" | wc -l

echo "Tip: run 'rclone lsl' on both sides to compare sizes/timestamps."
