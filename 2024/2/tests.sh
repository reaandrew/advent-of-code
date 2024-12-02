#! /bin/bash
# file: examples/equality_test.sh

testReturnsSafe() {
  assertEquals "$(echo "7 6 4 2 1" | awk -f solution.awk)" "safe"
}

testReturnUnsafeWithIncreaseOf5(){
  assertEquals "$(echo "1 2 7 8 9" | awk -f solution.awk)" "unsafe - difference too large: 5"
}

testReturnsUnsafeWithIncreaseOf4(){
  assertEquals "$(echo "9 7 6 2 1" | awk -f solution.awk)" "unsafe - difference too large: 4"
}

# Load shUnit2.
. shunit2