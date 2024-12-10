function checksum(data,   sum, pos, i, char){
    sum = 0
    n = length(data)
    for(i = 0; i < n; i++){
        pos = i
        char = substr(data, i + 1, 1)
        if(char != ".") {
            sum += pos * char
        }
    }
    return sum
}