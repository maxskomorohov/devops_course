#!/bin/bash
# This script checks root filesystem disk usage.
# It is intended to be run by crontab daily.
#
# If usage reaches or exceeds the warning threshold,
# it writes a warning message to the log file.
#
# DISK_FULL_LIMIT is the warning threshold in percent.
# Change DISK_FULL_LIMIT to adjust when the warning appears.

DISK_FULL_LIMIT=25
LOG_FILE_PATH=/var/log/disk.log

# awk: find the row where the last column is /, then take the value from column 5 and remove the % sign
CURRENT_DISK_USAGE=$(df -h | awk '$NF=="/" {gsub(/%/, "", $5); print $5}')

if [[ $CURRENT_DISK_USAGE -ge $DISK_FULL_LIMIT ]]; then
        echo "[WARNING] Current disk usage is $CURRENT_DISK_USAGE% (Warn limit: $DISK_FULL_LIMIT%)" >> $LOG_FILE_PATH
fi
