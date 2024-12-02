#! /bin/bash
# file: examples/equality_test.sh

testEquality() {
  assertEquals "$(echo "7 6 4 2 1" | awk -f solution.awk)" "safe"
}

# Load shUnit2.
. shunit2