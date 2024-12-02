#! /bin/bash
# file: examples/equality_test.sh

testReturnsSafe() {
  assertEquals "safe" "$(echo "7 6 4 2 1" | awk -f solution.awk)"
}

testReturnUnsafeWithIncreaseOf5(){
  assertEquals "unsafe - difference too large: 5" "$(echo "1 2 7 8 9" | awk -f solution.awk)"
}

testReturnsUnsafeWithIncreaseOf4(){
  assertEquals "unsafe - difference too large: 4" "$(echo "9 7 6 2 1" | awk -f solution.awk)"
}

testReturnsUnsafeWhenDecreaseAfterIncrease(){
  assertEquals  "unsafe - decrease after increase" "$(echo "1 3 2 4 5" | awk -f solution.awk)"
}

testReturnsUnsafeWhenIncreaseAfterDecrease(){
  assertEquals  "unsafe - increase after decrease" "$(echo "9 7 6 7 5" | awk -f solution.awk)"
}

# Load shUnit2.
. shunit2