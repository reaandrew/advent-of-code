#! /bin/bash

function answer(){
  printf "%b" "$1" | awk -f solution_part2.awk
}

testReturnsSumOfMultiplesWithDos(){
  assertEquals "48" "$(answer "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))")"
}

# Load shUnit2.
. shunit2