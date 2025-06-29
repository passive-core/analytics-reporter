#!/usr/bin/env bash

# 1. Your Cloud Run health endpoint:
URL="https://analytics-reporter-57158054598.us-central1.run.app/health"

# 2. Log file & timestamp
LOGFILE="\$HOME/health_checks.log"
TIMESTAMP="\$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

# 3. Fetch status
STATUS=\$(curl -s -o /dev/null -w "%{http_code}" "\$URL")

# 4. Record & (optionally) alert
if [[ "\$STATUS" -ne 200 ]]; then
  MESSAGE="\$TIMESTAMP – 🚨Health check FAILED. Status: \$STATUS"
  echo "\$MESSAGE" | tee -a "\$LOGFILE"
else
  echo "\$TIMESTAMP – ✅OK (200)" >> "\$LOGFILE"
fi
