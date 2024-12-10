# Advent of code

## 2024

This is my first year participating in advent of code and I thought I would take the opportunity to learn more about `awk`.  More specifically GNU AWK as I learned there are multiple implementations and each vary by feature [https://www.gnu.org/software/gawk/manual/html_node/Other-Versions.html](https://www.gnu.org/software/gawk/manual/html_node/Other-Versions.html).

### Day 1: Historian Hysteria

My idea here was to create a couple of arrays with the values, sort each independently and then loop through calculating and summing the absolute difference between each.

The END block allows for code to execute after all lines have been processed which is perfect for calculating the answer.

>A BEGIN rule is executed once only, before the first input record is read. Likewise, an END rule is executed once only, after all the input is read.
> [https://www.gnu.org/software/gawk/manual/html_node/Using-BEGIN_002fEND.html](https://www.gnu.org/software/gawk/manual/html_node/Using-BEGIN_002fEND.html)

### Day 2: Red-Nosed Reports

This puzzle came with additional requirements and rules for data processing. I wanted to tackle each line in order, focusing on the logic of each one. But I also wanted something that would point out if I'd broken any previous requirements while implementing the solution. For this, I thought it would be interesting to use shunit, which I've used before and which allows me to do TDD in bash—though this time I was using awk. It worked really well, and I think the tests are easy to write, read, and understand. The multiline test had me scratching my head a bit, but it turned out to be important as it showed that variables weren't being reset.

```shell
testReturnsSafe() {
  assertEquals "safe" "$(echo "7 6 4 2 1" | awk -f solution.awk)"
  assertEquals "safe" "$(echo "1 3 6 7 9" | awk -f solution.awk)"
}

testReturnUnsafeWithIncreaseOf5(){
  assertEquals "unsafe - difference too large: 5" "$(echo "1 2 7 8 9" | awk -f solution.awk)"
}
```

#### Part 2

This one stumped me and regardless of the tests I missed a crucial requirement.  The example showed these two lines:

```text
1 2 7 8 9: Unsafe regardless of which level is removed.
9 7 6 2 1: Unsafe regardless of which level is removed.
```
Which in hindsight I interpreted that any instance where the value is increasing after decreasing or vice versa is unsafe; which is incorrect.  It is only unsafe in this example as (like the example says) regardless of which level is removed it is still unsafe.  In other example though this may not be the case.

An AWKy thing which caught me too is arrays.  In AWK these are associative arrays!

After my initial set of attempts which included counting the failures thinking that if I detect more than one failure then it is unsafe otherwise it is safe.  I resorted to brute force, testing each version of the array with a level removed.  Finally, what was also evident was that I got a false sense of confidence from all my tests passing when really I was missing a requirement and in that regard, missing a test which would have shown me a failure.

**NB:** Admission - I only realised there was part 2 of these puzzles on day 3 <sigh>

### Day 3: Mull It Over

#### Part 1

This one felt like a regex as soon as I read it.  Pretty simple to identify the mul(n,n) pattern and even easier to multiply and sum.

For the testing I started with a single mul(n,n), then a test case with 2 mul(n,n) and then a final test case for the example scenario.

One important lesson I learnt here was the need to remove what has already been read from the string so the while loop did not hang.

```awk
$0 = substr($0, RSTART + RLENGTH);
```

#### Part 2

The requirements still felt like regex could be an easy answer here but the more I delved into it I just couldn't make the required matches. 

I thought I would take a longer approach (which actually felt shorter in the end) of creating a simple lexer to parse each character, build up a string, evaluate and continue.  The solution is pretty tight and I like it.

### Day 9: Disk Fragmenter

Running a little behind due to work commitments but Day 9 had me stumped trying to implement in AWK.  All the tests cases I had passed but when I ran the puzzle input it just wasn't correct and failed for large input sets.

In the end I abandoned the effort for the day and implemented part 1 and 2 in python using a two pointer approach for part 1 and an index approach for the compaction requirements.  This is the approach I tried to use for AWK too but I still cant put my finger on the issue, but I will.

A couple of interesting outputs though:

1. I used the python implementation (which was correct) to help me generate test cases I could trust in order to help me get to the bottom of why my AWK implementation was failing.

2. I found a useful way to test awk functions in isolation which I am going to use in the future.  The approach is to use the '-i (include)' argument for a file and then in the test simply invoke an inline awk string using the include file and then put the test subject invocation inside a BEGIN block e.g.:

```shell
testUncompress(){
    assertEquals "00...111...2...333.44.5555.6666.777.888899" "$(awk -i uncompress.awk '
    BEGIN {
    print uncompress("2333133121414131402")
    }')"
}
```