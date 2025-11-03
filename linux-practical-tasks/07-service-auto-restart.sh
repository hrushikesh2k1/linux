#!/bin/bash
##################################
# service_autorestart.sh
# Automatically restarts critical services if they are stopped
#
# Author: Hrushikesh Boora
# version: v1
#
##################################
# List of services to monitor
SERVICES=("nginx" "docker" "sshd")

# Log file location
LOG_FILE="/var/log/service_autorestart.log"

echo "===== Service Health Check - $(date) =====" >> $LOG_FILE

for service in "${SERVICES[@]}"; do
  STATUS=$(systemctl is-active $service)

  if [ "$STATUS" != "active" ]; then
    echo "⚠️  $service is DOWN — attempting to restart..." | tee -a $LOG_FILE
    sudo systemctl restart $service

    sleep 2  # Wait a moment before checking again
    STATUS_POST=$(systemctl is-active $service)

    if [ "$STATUS_POST" == "active" ]; then
      echo "✅ $service restarted successfully at $(date)" | tee -a $LOG_FILE
      logger "$service restarted successfully by auto-restart script"
    else
      echo "❌ Failed to restart $service — manual check needed!" | tee -a $LOG_FILE
      logger "ALERT: $service failed to restart automatically!"
      # Optional: send email alert
      # echo "$service failed to restart on $(hostname)" | mail -s "Service Alert: $service DOWN" admin@example.com
    fi
  else
    echo "✅ $service is running fine." | tee -a $LOG_FILE
  fi
done

echo "------------------------------------------" >> $LOG_FILE
