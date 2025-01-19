#!/bin/sh
set -e
BACKUP_DIR=/var/backups/cloud
DATA_DIR=/var/lib/grocy
mkdir -p $BACKUP_DIR
echo "Backing up grocy data"
tar -czf $BACKUP_DIR/grocy.tar.gz -C $DATA_DIR .
