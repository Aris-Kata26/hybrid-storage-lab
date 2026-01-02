# Session Report: Hybrid Storage Lab (Azure Primary)

## Overview

This session delivered a working hybrid storage engine with MinIO on‑prem and Azure Blob Storage as the primary cloud, orchestrated with rclone and simple shell scripts. The end‑to‑end demo (sync → delete → restore → verify) completed successfully.

## Environment

- On‑prem: MinIO via Docker Compose
- Cloud: Azure Blob Storage (primary)
- Sync tool: rclone (installed system‑wide)
- Repo: `hybrid-storage-lab`

## Configuration

- MinIO bucket: `onprem-storage`
- Azure container: `hybrid-storage-lab`
- rclone remotes:
  - `minio` → MinIO endpoint with access key/secret
  - `azure` → Azure Storage account/container
- rclone config source:
  - Either `~/.config/rclone/rclone.conf`
  - Or repo‑local: `scripts/rclone/rclone.conf` via `RCLONE_CONFIG`

## Demo Steps

1. Start MinIO
   ```bash
   docker compose up -d
   ```
2. Install and configure rclone (WSL/Ubuntu)
   ```bash
   sudo -E apt update && sudo -E apt install -y rclone
   cp scripts/rclone/rclone.conf.template scripts/rclone/rclone.conf
   export RCLONE_CONFIG="$PWD/scripts/rclone/rclone.conf"
   ```
3. Load test data to MinIO
   ```bash
   rclone copy samples/test-data minio:onprem-storage
   ```
4. Sync MinIO → Azure
   ```bash
   ./scripts/rclone/sync_to_azure.sh
   ```
5. Verify object counts on both sides
   ```bash
   ./scripts/rclone/verify.sh
   ```
6. Simulate deletion on‑prem and restore from cloud
   ```bash
   rclone deletefile "minio:onprem-storage/sample.txt"
   ./scripts/rclone/sync_from_azure.sh
   ./scripts/rclone/verify.sh
   ```

## Results

- Sync completed without errors.
- Deleted object on MinIO was restored from Azure.
- Verification showed matching object counts before/after restore.

## Notes & Improvements

- Packaging upgrades added:
  - Repo‑local rclone config option using `RCLONE_CONFIG`.
  - README quickstart for 10‑minute reproduction.
  - Mermaid architecture diagram in `docs/architecture-diagram.md`.
- Next‑phase ideas (optional):
  - SAS tokens and scoped access for Azure
  - Terraform for cloud resource provisioning
  - Cron or systemd timers for scheduled sync

## Conclusion

The hybrid storage engine is technically complete and now portfolio‑grade with clear documentation and reproducibility. The next focused session can deliver an "enterprise upgrade" (IaC + scheduling + tighter security).
