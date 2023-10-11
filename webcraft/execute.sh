#!/bin/bash

# Check if the src directory exists, if not, create it
if [ ! -d "src" ]; then
  mkdir -p src
fi

# Create a simple HTML page in src/page.html
echo "<html><body><h1>Hello, Webcraft!</h1></body></html>" > src/page.html
