#!/bin/bash

# Set the path to your source folder here:
SRC="/media/DATA/"
# Set the path to your external harddisk (or wherever you want to backup your files)
DEST="/media/user/HARDDISK/"

timestamp="$(date +'%Y-%m-%d')"
# A log of the process is written to this log-file
filename="log_rsync_backup_$timestamp.txt"

echo "=== SIMPLE RSYNC BACKUP SCRIPT ==="
echo "Starting to copy new files from "$SRC" to "$DEST
echo "Files that are not in "$SRC" are deleted from "$DEST"!"

echo "Performing backup..."
echo "(You can watch the process by looking at this file: " $filename ")"
rsync -a --progress --delete $SRC $DEST --stats > $filename
echo "END OF FILE" > $filename

echo "=== FINISHED BACKUP! === "
echo "=== SHUTTING DOWN COMPUTER... === "
sleep 10
sudo shutdown -P now