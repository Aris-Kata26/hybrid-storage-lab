# Local Setup (MinIO)

## Prerequisites

- Docker and Docker Compose
- rclone (install if not present)

## Environment Variables

Create a `.env` file in the project root:

```bash
MINIO_ROOT_USER=minioadmin
MINIO_ROOT_PASSWORD=minioadmin123
```

**Important**: Never commit `.env` to version control.

## Start MinIO

```bash
docker compose up -d
```

## Access MinIO Console

Open http://localhost:9001 in your browser.

Login with:
- Username: minioadmin
- Password: minioadmin123

## Create Bucket

1. In MinIO console, click "Create Bucket"
2. Name: `onprem-storage`
3. Keep default settings

## Upload Test Data

Upload `samples/test-data/sample.txt` to the `onprem-storage` bucket via the console.

## Stop MinIO

```bash
docker compose down
