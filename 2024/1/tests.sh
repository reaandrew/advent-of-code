#! /bin/bash

function testSomething(){
  assertEquals  "31" "$(awk -f solution.awk <<EOF
3   4
4   3
2   5
1   3
3   9
3   3
EOF
)"
}

# Load shUnit2.
. shunit2