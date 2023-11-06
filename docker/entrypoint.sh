#!/bin/bash
set -eou pipefail

ENVIRONMENT=${ENV:-"DEV"}
echo "Starting the server $ENVIRONMENT"
if [ "$ENVIRONMENT" = "LOCAL" ]; then
  pip install uvicorn
  python ./app/database/utils/migrate.py
  echo "Starting development uvicorn server"
  uvicorn app.main:app --reload --port 5000 --host 0.0.0.0
fi
# Infinite loop for debug
while :; do echo "CTRL+C to exit -> ${ENVIRONMENT}"; sleep 1000; done