#!/bin/bash

# Define a function to compare the output of the script with the expected output
assert_output() {
  expected="$1"
  actual="$2"

  if [ "$actual" == "$expected" ]; then
    echo "Test passed: Output matches the expected result."
  else
    echo "Test failed: Output does not match the expected result."
    echo "Expected: $expected"
    echo "Actual:   $actual"
    exit 1  # Exit with a non-zero status code to indicate test failure
  fi
}

# Test case 1: Run the execute.sh script
./execute.sh

# Test case 2: Check the generated merged-scrolls.csv file
expected_output="Item,Value(Silver Sovereigns)
Item1,Value1
Item2,Value2"
actual_output=$(cat out/merged-scrolls.csv)

# Call the assert_output function to compare the actual and expected outputs
assert_output "$expected_output" "$actual_output"
