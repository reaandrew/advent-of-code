#! /bin/bash

function answer(){
  printf "%b" "$1" | awk -f solution.awk
}

testUncompress(){
  assertEquals "00...111...2...333.44.5555.6666.777.888899" "$(awk -i uncompress.awk '
  BEGIN {
    print uncompress("2333133121414131402")
  }')"
}

testUncompressSmall(){
  assertEquals "0..111....22222" "$(awk -i uncompress.awk '
  BEGIN {
    print uncompress("12345")
  }')"
}

testUncompressLarge(){
  assertEquals "0000001111111..2......3333......44......5555...6..777........888888.......99999999.........10101010111111111111111111" "$(awk -i uncompress.awk '
  BEGIN {
    print uncompress("60721646264312386789409")
  }')"
}

testDefrag(){
    assertEquals "0099811188827773336446555566.............." "$(awk -i defrag.awk '
    BEGIN {
      print defrag("00...111...2...333.44.5555.6666.777.888899")
    }')"
}

testDefragSmall(){
    assertEquals "022111222......" "$(awk -i defrag.awk '
    BEGIN {
      print defrag("0..111....22222")
    }')"
}

testDefragLarge(){
      assertEquals "00000011111111111211111111111133331110101010944999999555598868877788................................................." "$(awk -i defrag.awk '
      BEGIN {
        print defrag("0000001111111..2......3333......44......5555...6..777........888888.......99999999.........10101010111111111111111111")
      }')"
}

testReturnsSingleMultiple() {
  assertEquals "1928" "$(awk -i checksum.awk '
  BEGIN {
     print checksum("0099811188827773336446555566..............")
  }')"
}

# Load shUnit2.
. shunit2