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
        sum += list1[i] * getNoOfOccurences(list1[i], list2, NR)
    }

    print sum
}

function getNoOfOccurences(subject, arr, len){
    total=0
    for (pos=0;pos<len;pos++){
        if (arr[pos] == subject){
            total++
        }
    }
    return total
}
