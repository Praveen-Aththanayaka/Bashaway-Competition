#!/bin/bash

# Check if the password length is at least 8 characters
if [ ${#1} -lt 8 ]; then
    echo "false"
    exit 0
fi

# Check if the password contains at least 1 lowercase alphabetical character
if ! [[ $1 =~ [a-z] ]]; then
    echo "false"
    exit 0
fi

# Check if the password contains at least 1 uppercase alphabetical character
if ! [[ $1 =~ [A-Z] ]]; then
    echo "false"
    exit 0
fi

# Check if the password contains at least 1 numeric character
if ! [[ $1 =~ [0-9] ]]; then
    echo "false"
    exit 0
fi

# If all conditions are met, the password is strong
echo "true"
