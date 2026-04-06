#!/bin/bash


#####################################################################################


#1. Variables
LOG_DIR="/var/log/myapp"
LOG_FILE="/var/log/my_app/log_rotation.log"


#####################################################################################


#2. Ensure Log Directory Exists

if [ ! d "$LOG_DIR" ]; then
	echo"[$(date)] Error the directory "$LOG_DIR" does not exist!" >> "$LOG_FILE"
	exit 1
fi


#####################################################################################


#3. Compress logs older than 7 days less than 30 days

find "$LOG_DIR" -type f -name "*.log" -mtime +7 -mtime -30 !-name "*.gz" -exec gzip {} \; -exec echo "[($date)] Compressed: {}" >> "$LOG_FILE" \;


#####################################################################################


#4. Delete the files older than 30 days

find "LOG_DIR" -type f -name "*.gz" mtime -30 -exec rm -f {} \; -exec echo "[($date)] Deleted: {}" >> "$LOG_FILE" \;


#####################################################################################



#5. Completion Message
echo "[($date)] Log Rotation completed sucessfully" >> "$LOG_FILE"



