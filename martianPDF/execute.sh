#!/bin/bash

# Check if the 'src' directory exists and is not empty
if [ -d "src" ] && [ "$(ls -A src)" ]; then
    # Check if a page number argument is provided
    if [ -n "$1" ]; then
        # Check if the PDF file exists
        if [ -f "src/mystery.pdf" ]; then
            # Use 'pdftotext' to extract the text from the specified page
            text=$(pdftotext -f "$1" -l "$1" "src/mystery.pdf" -)
            
            # Check if text extraction was successful
            if [ -n "$text" ]; then
                # Count the number of words in the extracted text
                word_count=$(echo "$text" | wc -w)
                echo "$word_count"
            else
                # No text found on the specified page
                echo "0"
            fi
        else
            # PDF file not found
            echo "0"
        fi
    else
        # Page number argument not provided
        echo "0"
    fi
else
    # 'src' directory does not exist or is empty
    echo "0"
fi
