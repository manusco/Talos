#!/bin/bash
# ==============================================================================
# Agentic Stack Backup Script
# ==============================================================================
# Description: Dumps databases from the Postgres container to the host.
# Usage: ./backup.sh
# ==============================================================================

set -e

# Load .env if present
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

BACKUP_PATH="${BACKUP_DIR:-./backups}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
CONTAINER_NAME="postgres"
PG_USER="postgres"

mkdir -p "$BACKUP_PATH"

echo "=== Starting Backup [$TIMESTAMP] ==="

# 1. Backup n8n Database
echo "Backing up n8n_db..."
docker exec -t "$CONTAINER_NAME" pg_dump -U "$PG_USER" n8n_db | gzip > "$BACKUP_PATH/n8n_db_$TIMESTAMP.sql.gz"

# 2. Backup OpenClaw Database
echo "Backing up openclaw_db..."
docker exec -t "$CONTAINER_NAME" pg_dump -U "$PG_USER" openclaw_db | gzip > "$BACKUP_PATH/openclaw_db_$TIMESTAMP.sql.gz"

# 3. Retention Policy (Delete older than 7 days)
echo "Cleaning up backups older than 7 days..."
find "$BACKUP_PATH" -name "*.sql.gz" -type f -mtime +7 -delete

echo "=== Backup Complete ==="
echo "Files saved to $BACKUP_PATH"
ls -lh "$BACKUP_PATH" | grep "$TIMESTAMP"
