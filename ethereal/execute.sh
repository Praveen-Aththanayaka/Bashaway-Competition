# etherealbinarybeast command will be available once the tests are run
#!/bin/bash

# Check if 'etherealbinarybeast' command exists
if command -v etherealbinarybeast &> /dev/null; then
  # Run 'etherealbinarybeast'
  etherealbinarybeast
else
  echo "Error: 'etherealbinarybeast' command not found. It may not be set up yet."
  exit 1
fi

