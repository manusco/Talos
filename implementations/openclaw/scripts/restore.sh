#!/bin/bash
# ==============================================================================
# Agentic Stack Restore Guide
# ==============================================================================
# This is a guide script. It will print instructions on how to restore.
# We do not automate restore blindly to prevent accidental data loss.
# ==============================================================================

echo "=== How to Restore Databases ==="
echo ""
echo "WARNING: Restoring a database will overwrite current data!"
echo ""
echo "To restore n8n_db:"
echo "------------------"
echo "1. Find your backup file in ./backups/"
echo "2. Unzip it: gunzip <filename>.sql.gz"
echo "3. Run:"
echo "   cat <filename>.sql | docker exec -i postgres psql -U postgres -d n8n_db"
echo ""
echo "To restore openclaw_db:"
echo "-----------------------"
echo "1. Find your backup file in ./backups/"
echo "2. Unzip it: gunzip <filename>.sql.gz"
echo "3. Run:"
echo "   cat <filename>.sql | docker exec -i postgres psql -U postgres -d openclaw_db"
echo ""
echo "=== End Guide ==="
