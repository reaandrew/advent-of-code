#!/usr/bin/awk -f
{
    n = split($0, levels, " ")
    safe=0
    if (process(levels, n) == 1 ){
        safe = 1
    }else {
        for (exclude_pos = 1; exclude_pos <= n; exclude_pos++) {
            copyArray(levels, n, level_copy, exclude_pos)
            if (process(level_copy, n) == 1){
                safe = 1
                break
            }
        }
    }
    if (safe == 1){
        print "safe"
    }else{
        print "unsafe"
    }
}

function copyArray(arr, len, arr_copy, exclude_pos) {
    delete arr_copy
    new_pos = 1
    for (i = 1; i <= len; i++) {
        if (i != exclude_pos) {
            arr_copy[new_pos++] = arr[i]
        }
    }
}

function process(arr, len    ,i,difference,direction) {
    for (i = 2; i < len; i++){
        difference = arr[i-1] < arr[i] ? arr[i] - arr[i-1] : arr[i-1] - arr[i];

        if (difference > 3 || difference < 1){
            return 0
        }
        if (direction == ""){
            direction = arr[i] < arr[i-1] ? -1 : 1;
        }
        if (direction == -1 && arr[i] > arr[i-1]){
            return 0
        }

        if (direction == 1 && arr[i] < arr[i-1]){
            return 0
        }
    }
    return 1
}