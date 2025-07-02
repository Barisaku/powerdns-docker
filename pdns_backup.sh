#!/bin/bash

# Backup destination
BACKUP_BASE="/root/pdns_backup"
TODAY=$(date +%F)
WORKDIR="/tmp/pdns_backup_$TODAY"
FINAL_ARCHIVE="$BACKUP_BASE/pdns_full_backup_$TODAY.tar.gz"

# Create working directory
mkdir -p "$WORKDIR"

# Backup volumes
docker run --rm -v pdns_powerdns_auth:/data -v "$WORKDIR:/backup" alpine \
    tar czf /backup/pdns_auth.tar.gz -C /data .

docker run --rm -v pdns_powerdns_web:/data -v "$WORKDIR:/backup" alpine \
    tar czf /backup/pdns_web.tar.gz -C /data .

# Copy config and env files
cp -r /root/pdns/conf "$WORKDIR/conf"
cp /root/pdns/api-key.env "$WORKDIR/"

# Create final archive
mkdir -p "$BACKUP_BASE"
tar czf "$FINAL_ARCHIVE" -C "$WORKDIR" .

# Remove temporary working directory
rm -rf "$WORKDIR"

# Keep only the latest 3 backup files
cd "$BACKUP_BASE"
ls -1t pdns_full_backup_*.tar.gz | tail -n +4 | xargs -r rm -f

echo "$FINAL_ARCHIVE created"
