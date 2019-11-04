#!/bin/sh
set -e
BACKUP_DIR=/var/backups/cloud

mkdir -p $BACKUP_DIR
echo "Backing up partkeepr mysql..."
savelog $BACKUP_DIR/partkeepr_db.sql
docker exec -t partkeepr_db mysqldump -u partkeepr -ppartkeepr partkeepr > $BACKUP_DIR/partkeepr_db.sql

echo "Backing up partkeepr files..."
savelog $BACKUP_DIR/partkeepr_data.tar
docker exec partkeepr_app tar cf - -C / var/www/html/data > $BACKUP_DIR/partkeepr_data.tar
echo "Backup done"
