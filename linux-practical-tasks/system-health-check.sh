##System health check
#######################
# Author: Hrushikesh Boora
# version: v1
#
#
#
#######################


#!/bin/bash
# Generates daily system health summary

REPORT="/tmp/system_health_$(date +%F).log"

echo "===== SYSTEM HEALTH REPORT =====" > $REPORT
echo "Hostname: $(hostname)" >> $REPORT
echo "Date: $(date)" >> $REPORT
echo "--------------------------------" >> $REPORT

echo "Uptime:" >> $REPORT
uptime -p >> $REPORT
echo "--------------------------------" >> $REPORT

echo "CPU Usage:" >> $REPORT
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "% used"}' >> $REPORT
echo "--------------------------------" >> $REPORT

echo "Memory Usage:" >> $REPORT
free -h | awk '/^Mem:/ {print $3 "/" $2 " used"}' >> $REPORT
echo "--------------------------------" >> $REPORT

echo "Disk Usage:" >> $REPORT
df -h --output=source,pcent,target | grep -vE '^Filesystem' >> $REPORT
echo "--------------------------------" >> $REPORT

echo "Top 5 Processes by CPU:" >> $REPORT
ps -eo pid,cmd,%cpu,%mem --sort=-%cpu | head -n 6 >> $REPORT
echo "--------------------------------" >> $REPORT

echo "Health report generated: $REPORT"
