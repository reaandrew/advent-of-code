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