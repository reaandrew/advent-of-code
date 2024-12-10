#! /bin/bash

testUncompress(){
  assertEquals "00...111...2...333.44.5555.6666.777.888899" "$(awk -i uncompress.awk '
  BEGIN {
    print uncompress("2333133121414131402")
  }')"
}

# Load shUnit2.
. shunit2