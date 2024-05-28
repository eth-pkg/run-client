#!/bin/bash

set -E 

PORT=8551
IP="127.0.0.1"

echo "Checking for processes using $IP:$PORT"

# Using ss
echo "Using ss command:"
sudo ss -tuln | grep $PORT

# Using netstat
echo "Using netstat command:"
sudo netstat -tuln | grep $PORT

# Using fuser
echo "Using fuser command:"
PIDS=$(sudo fuser $PORT/tcp 2>/dev/null)
if [ -z "$PIDS" ]; then
    echo "No process found using port $PORT"
else
    echo "Processes using port $PORT: $PIDS"
    for PID in $PIDS; do
        ps -p $PID -o pid,comm,args
    done
fi

# Using lsof
echo "Using lsof command:"
sudo lsof -i TCP:$PORT
