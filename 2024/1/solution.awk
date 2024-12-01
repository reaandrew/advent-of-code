#!/usr/bin/env gawk
BEGIN{
    sum=0
}
{
    list1[NR] = $1
    list2[NR] = $2
}
END {
    asort(list1)
    asort(list2)

    for (i = 1; i <= length(list1); i++){
        sum += abs(list1[i] - list2[i])
    }

    print sum
}

function abs(x) {
    return (x < 0) ? -x : x
}
