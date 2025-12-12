#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: cleanup-port <port_number>"
    exit 1
fi

PORT=$1

echo "🔍 Checking for processes using port $PORT..."
PIDS=$(sudo ss -ltnp | grep $PORT | grep -oP 'pid=\K[0-9]+')

if [ -z "$PIDS" ]; then
    echo "No processes found on port $PORT"
else
    echo "Killing stale docker-proxy processes..."
    for pid in $PIDS; do
        echo " - Killing PID: $pid"
        sudo kill -9 $pid
    done
fi

echo "Restarting Docker..."
sudo systemctl restart docker

echo "Done! Port $PORT is now clean."
