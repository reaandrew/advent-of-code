#! /bin/bash
# file: examples/equality_test.sh

testReturnsSafe() {
  assertEquals "safe" "$(echo "7 6 4 2 1" | awk -f solution.awk)"
  assertEquals "safe" "$(echo "1 3 6 7 9" | awk -f solution.awk)"
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

testReturnsUnsafeWhenNoDifference(){
  assertEquals  "unsafe - no difference" "$(echo "8 6 4 4 1" | awk -f solution.awk)"
}

testMultipleLines(){
  expected_output=$(printf "safe\nunsafe - difference too large: 5")
  actual_output=$(printf "7 6 4 2 1\n1 2 7 8 9" | awk -f solution.awk)
  assertEquals "$expected_output" "$actual_output"
}

# Load shUnit2.
. shunit2