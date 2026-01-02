# Hybrid Storage Lab: Azure Primary

Professional hybrid storage solution with MinIO on‑prem and Azure Blob as the primary cloud. Reproducible in ~10 minutes.

## Architecture

- On‑prem: MinIO (S3‑compatible)
- Cloud: Azure Blob Storage (primary)
- Sync: rclone (bidirectional)

See the visual flow in `docs/architecture-diagram.md`.

## 10‑Minute Quickstart (WSL/Linux)

### Prerequisites

- Docker + Docker Compose
- Azure Storage Account + Container (e.g., `hybrid-storage-lab`)
- rclone installed in your shell (WSL recommended on Windows)

### Steps

1) Start services

```bash
docker compose up -d
```

2) Install rclone (WSL/Ubuntu)

```bash
sudo -E apt update
sudo -E apt install -y rclone
```

3) Configure rclone remotes

Option A — use repo-local config:

```bash
cp scripts/rclone/rclone.conf.template scripts/rclone/rclone.conf
export RCLONE_CONFIG="$PWD/scripts/rclone/rclone.conf"
```

Option B — use your user config:

```bash
mkdir -p ~/.config/rclone
cp scripts/rclone/rclone.conf.template ~/.config/rclone/rclone.conf
```

Update the copied config with your Azure credentials and MinIO endpoint/access keys.

4) Load sample data into MinIO

```bash
rclone copy samples/test-data minio:onprem-storage
```

5) Run the demo

```bash
./scripts/rclone/sync_to_azure.sh
./scripts/rclone/verify.sh

# Simulate deletion on-prem
rclone deletefile "minio:onprem-storage/sample.txt"

# Restore from Azure back to MinIO
./scripts/rclone/sync_from_azure.sh
./scripts/rclone/verify.sh
```

## Documentation

- `docs/architecture.md` — Overview
- `docs/architecture-diagram.md` — Mermaid diagram
- `docs/setup-local.md` — Local environment
- `docs/setup-azure.md` — Azure setup
- `docs/demo.md` — Full demo walkthrough
- `docs/security.md` — Security baseline
- `docs/session-report.md` — Session summary and results

## Scripts

- `scripts/rclone/sync_to_azure.sh` — Sync MinIO → Azure
- `scripts/rclone/sync_from_azure.sh` — Restore Azure → MinIO
- `scripts/rclone/verify.sh` — Verify object counts

Tips:

- Ensure `rclone` is on your PATH (`command -v rclone`).
- Set `RCLONE_CONFIG` to use the repo-local config if preferred.
