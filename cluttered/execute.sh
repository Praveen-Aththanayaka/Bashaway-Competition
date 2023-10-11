docker pull mongo:latest

if [ ! "$(docker ps -a | grep bashaway-2k23-cluttered)" ]; then
    docker run -d --name bashaway-2k23-cluttered -p 27207:27017 mongo
fi

# Data will be populated into the above database instance once the tests are run.

# Write your code here
#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker and ensure it's running."
    exit 1
fi

# Check if MongoDB is installed
if ! command -v mongo &> /dev/null; then
    echo "MongoDB is not installed. Please install MongoDB and ensure it's running on port 27207."
    exit 1
fi

# MongoDB connection string
MONGO_URI="mongodb://localhost:27207/?directConnection=true"

# Database name
DB_NAME="bashaway-2k23-cluttered"

# Remove all collections except "settings"
mongo "$MONGO_URI/$DB_NAME" --eval 'db.getCollectionNames().forEach(function(coll){if(coll!="settings") db[coll].remove({});});'


