# Advent of code

## 2024

This is my first year participating in advent of code and I thought I would take the opportunity to learn more about `awk`.  More specifically GNU AWK as I learned there are multiple implementations and each vary by feature [https://www.gnu.org/software/gawk/manual/html_node/Other-Versions.html](https://www.gnu.org/software/gawk/manual/html_node/Other-Versions.html).

### Puzzle 1 (Day 1: Historian Hysteria)

My idea here was to create a couple of arrays with the values, sort each independently and then loop through calculating and summing the absolute difference between each.

The END block allows for code to execute after all lines have been processed which is perfect for calculating the answer.

>A BEGIN rule is executed once only, before the first input record is read. Likewise, an END rule is executed once only, after all the input is read.
> [https://www.gnu.org/software/gawk/manual/html_node/Using-BEGIN_002fEND.html](https://www.gnu.org/software/gawk/manual/html_node/Using-BEGIN_002fEND.html)

### Puzzle 2 (Day 2: Red-Nosed Reports)

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