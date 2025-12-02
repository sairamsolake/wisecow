#!/bin/bash

# =============================
# WEB LOG ANALYZER SCRIPT
# =============================
# Pass log file as argument:
# ./log_analyzer.sh /var/log/nginx/access.log

LOG_FILE="$1"

if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <log-file>"
    exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found!"
    exit 1
fi

echo "===== Log Analysis Report ====="
echo "File: $LOG_FILE"
echo "Generated at: $(date)"
echo ""

# Count 404 Errors
echo "📌 Number of 404 Errors:"
grep " 404 " "$LOG_FILE" | wc -l
echo ""

# Most requested pages:
echo "📌 Top 10 Most Requested Pages:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10
echo ""

# IPs with most hits:
echo "📌 Top 10 IPs with Most Requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10
echo ""

echo "===== Analysis Complete ====="

