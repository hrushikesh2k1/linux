#!/bin/bash
############################################
# user_access_audit.sh
# Generate a system user access audit report
#
# Author: Hrushikesh Boora
# version: v1
#
###########################################

REPORT="/tmp/user_access_audit_$(date +%F).log"

echo "===== User Access Audit Report =====" | tee $REPORT
echo "Generated on: $(date)" | tee -a $REPORT
echo "Hostname: $(hostname)" | tee -a $REPORT
echo "------------------------------------" | tee -a $REPORT

echo -e "\n All Users on System:" | tee -a $REPORT
getent passwd | awk -F: '{ print $1 }' | tee -a $REPORT

echo -e "\n  Users with Sudo Privileges:" | tee -a $REPORT
grep '^sudo:.*$' /etc/group | cut -d: -f4 | tr ',' '\n' | tee -a $REPORT

echo -e "\n📅 Last Login Information:" | tee -a $REPORT
lastlog | tee -a $REPORT

echo -e "\n Password Expiry Information:" | tee -a $REPORT
for user in $(getent passwd | awk -F: '{print $1}'); do
  echo "User: $user" | tee -a $REPORT
  chage -l $user 2>/dev/null | grep "Account expires" | tee -a $REPORT
done

echo -e "\n Report generated at: $REPORT"
echo "------------------------------------" | tee -a $REPORT
