#!/bin/bash
# disk_usage_alert.sh
# Alerts if any partition crosses 80% usage

THRESHOLD=80
HOST=$(hostname)
ALERT_FILE="/tmp/disk_alert_$(date +%F).log"

echo "===== Disk Usage Alert Report - $HOST =====" > $ALERT_FILE
echo "Generated on: $(date)" >> $ALERT_FILE
echo "------------------------------------------" >> $ALERT_FILE

# Loop through each disk (skip header)
df -h --output=source,pcent,target | tail -n +2 | while read line; do
  USAGE=$(echo $line | awk '{print $2}' | sed 's/%//')
  MOUNT=$(echo $line | awk '{print $3}')

  if [ $USAGE -ge $THRESHOLD ]; then
    echo "⚠️ WARNING: $MOUNT is ${USAGE}% full" >> $ALERT_FILE
  else
    echo "✅ OK: $MOUNT is ${USAGE}% used" >> $ALERT_FILE
  fi
done

echo "------------------------------------------" >> $ALERT_FILE
echo "Report saved at $ALERT_FILE"

# Optional: Email alert if any warning exists
if grep -q "⚠️ WARNING" $ALERT_FILE; then
  echo "Disk usage exceeded $THRESHOLD% on $HOST!"
  # Uncomment below line to send email (if mailutils installed)
  # mail -s "[$HOST] Disk Usage Alert" admin@example.com < $ALERT_FILE
fi
