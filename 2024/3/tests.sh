#! /bin/bash

function answer(){
  printf "%b" "$1" | awk -f solution.awk
}

testReturnsSingleMultiple() {
  assertEquals "2024" "$(answer "mul(44,46)")"
}

testReturnsSumOfMultiples(){
  assertEquals "2030" "$(answer "mul(44,46),mul(2,3)")"
}

testReturnsSumOfMultiplesIgnoringCorruption(){
  assertEquals "161" "$(answer "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")"
}

# Load shUnit2.
. shunit2