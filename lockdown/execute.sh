#!/bin/bash

# Check if the file 'src/relic.txt' exists
if [ -f "src/relic.txt" ]; then
  # Set read-only permissions for the file
  chmod 400 src/relic.txt
  echo "Read-only access granted to 'relic.txt'"
else
  echo "Error: 'relic.txt' not found in the 'src' directory."
  exit 1
fi
