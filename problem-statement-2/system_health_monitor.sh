#!/bin/bash

# ===========================
# System Health Monitor Script
# ===========================

LOG_FILE="/var/log/system_health.log"

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
PROC_THRESHOLD=300

# Get system metrics
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')
MEM_USAGE=$(free | grep Mem | awk '{print int($3/$2 * 100.0)}')
DISK_USAGE=$(df -h / | awk 'NR==2{print int($5)}')
PROCESS_COUNT=$(ps -e --no-headers | wc -l)

echo "==============================" | tee -a $LOG_FILE
echo " System Health Report - $(date)" | tee -a $LOG_FILE
echo "==============================" | tee -a $LOG_FILE

# CPU Check
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "ALERT: High CPU usage: ${CPU_USAGE}% (Threshold: ${CPU_THRESHOLD}%)" | tee -a $LOG_FILE
else
    echo "CPU Usage: ${CPU_USAGE}%" | tee -a $LOG_FILE
fi

# Memory Check
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    echo "ALERT: High Memory usage: ${MEM_USAGE}% (Threshold: ${MEM_THRESHOLD}%)" | tee -a $LOG_FILE
else
    echo "Memory Usage: ${MEM_USAGE}%" | tee -a $LOG_FILE
fi

# Disk Check
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "ALERT: High Disk usage: ${DISK_USAGE}% (Threshold: ${DISK_THRESHOLD}%)" | tee -a $LOG_FILE
else
    echo "Disk Usage: ${DISK_USAGE}%" | tee -a $LOG_FILE
fi

# Process Check
if [ "$PROCESS_COUNT" -gt "$PROC_THRESHOLD" ]; then
    echo "ALERT: Too many running processes: ${PROCESS_COUNT} (Threshold: ${PROC_THRESHOLD})" | tee -a $LOG_FILE
else
    echo "Running Processes: ${PROCESS_COUNT}" | tee -a $LOG_FILE
fi

echo "Health check completed."
echo

