#! /bin/bash

function answer(){
  printf "%b" "$1" | awk -f solution.awk
}

function test(){
  expected=$1
  input=$2
}

testReturnsSafe() {
  assertEquals "safe" "$(answer "7 6 4 2 1")"
  assertEquals "safe" "$(answer  "1 3 6 7 9")"
}

testReturnUnsafeWithIncreaseOf5(){
  assertEquals "unsafe - difference too large: 5" "$(answer "1 2 7 8 9")"
}

testReturnsUnsafeWithIncreaseOf4(){
  assertEquals "unsafe - difference too large: 4" "$(answer "9 7 6 2 1")"
}

testReturnsSafeWhenSingleDecreaseAfterIncrease(){
  assertEquals  "safe" "$(answer "1 3 2 4 5")"
}

testReturnsSafeWhenSingleIncreaseAfterDecrease(){
  assertEquals  "safe" "$(answer "9 7 6 7 5")"
}

testReturnsSafeWhenSingleIncreaseAfterDecreaseAtEndOfSequence(){
  assertEquals  "safe" "$(answer "9 7 6 5 7")"
}

testReturnsSafeWhenSingleNoDifference(){
  assertEquals  "safe" "$(answer "8 6 4 4 1")"
}

testReturnsUnsafeWhenMultipleIncreaseAfterDecrease(){
  assertEquals  "unsafe - increase after decrease" "$(answer "9 7 6 7 5 6")"
}

testReturnsUnsafeWhenMultipleNoDifference(){
  assertEquals  "unsafe - no difference" "$(answer "8 6 4 4 1 1")"
}

testReturnsUnsafeWhenMultipleDecreaseAfterIncrease(){
  assertEquals  "unsafe - decrease after increase" "$(answer "1 3 2 4 5 4")"
}

testReturnsUnsafeWhenSingleDecreaseAfterIncreaseThenNoDifference(){
    assertEquals  "unsafe - no difference" "$(answer "1 3 2 4 5 5")"
}

testMultipleLines(){
  expected_output=$(printf "safe\nunsafe - difference too large: 5")
  actual_output=$(answer "7 6 4 2 1\n1 2 7 8 9")
  assertEquals "$expected_output" "$actual_output"
}

# Load shUnit2.
. shunit2