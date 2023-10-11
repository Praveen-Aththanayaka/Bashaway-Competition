#!/bin/bash

# Redis credentials
redis_username="default"
redis_password="5ax4*1$2"
redis_port="6380"

# Function to wait for Redis to be ready
wait_for_redis() {
  attempts=0
  while true; do
    if [ $attempts -ge 20 ]; then
      echo "Error: Max retries reached. Redis connection failed."
      exit 1
    fi

    if redis-cli -u "redis://${redis_username}:${redis_password}@localhost:${redis_port}" ping &>/dev/null; then
      echo "Redis is ready."
      break
    else
      echo "Waiting for Redis to be ready (Attempt $attempts)..."
      sleep 2
      attempts=$((attempts + 1))
    fi
  done
}

# Wait for Redis to be ready
wait_for_redis

# Your mission: Inject 500 random stringy keys and values into this cache
# Add code here to inject keys and values into Redis

# Include the special key 'bashaway-2k23' with its value set to the current timestamp in epoch format (milliseconds)
timestamp=$(date +%s%3N)
redis-cli -u "redis://${redis_username}:${redis_password}@localhost:${redis_port}" SET bashaway-2k23 $timestamp

# Mission accomplished!
echo "Redis mission completed."
