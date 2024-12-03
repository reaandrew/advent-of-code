#! /bin/bash

function answer(){
  printf "%b" "$1" | awk -f solution.awk
}

function test(){
  expected=$1
  input=$2
}

testReturnsSingleMultiple() {
  assertEquals "2024" "$(answer "mul(44,46)")"
}

testReturnsSumOfMultiples(){
  assertEquals "2030" "$(answer "mul(44,46),mul(2,3)")"
}

# Load shUnit2.
. shunit2