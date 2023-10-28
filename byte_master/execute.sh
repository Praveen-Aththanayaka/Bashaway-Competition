# A random count of files will be generated within the src directory once the tests are run.

# Write your code here
#!/bin/bash

# Calculate the total size of all files in 'src' folder in bytes
total_size=$(find src -type f -exec stat --format="%s" {} \; | awk '{s+=$1} END {print s}')

# Print the total size to the console
echo "$total_size"
