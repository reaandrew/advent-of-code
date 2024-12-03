BEGIN{
    sum = 0
}
{
    while( match($0,/mul\(([0-9]+),([0-9]+)\)/, arr) ){
        sum += arr[1] * arr[2]
        $0 = substr($0, RSTART + RLENGTH);
    }
}
END{
    print sum
}