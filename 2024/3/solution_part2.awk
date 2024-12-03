BEGIN{
    sum=0
    RS=""
}
{
    is_matching=1
    current=""
    for (i = 1; i <= length($0); i++) {
        char = substr($0, i, 1)
        current = current char
        if (index(current,"don't()")){
            is_matching=0
            current=""
        }
        if (index(current,"do()")){
            is_matching=1
            current=""
        }
        if (is_matching==1 && match(current,/mul\(([0-9]+),([0-9]+)\)/, arr)){
            sum += arr[1] * arr[2]
            current=""
        }
    }
}
END{
    print sum
}