#!/bin/sh
set -e
BACKUP_DIR=/var/backups/cloud
POSTGRES_BACKUP_FNAME=$BACKUP_DIR/soaring-coupons-db.dump
mkdir -p $BACKUP_DIR

echo "Backing up soaring-coupons database"
savelog $POSTGRES_BACKUP_FNAME
dokku postgres:export soaring-coupons-db > $POSTGRES_BACKUP_FNAME
echo "Backup done"
