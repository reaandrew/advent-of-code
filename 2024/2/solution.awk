#!/usr/bin/awk -f
{
    n = split($0, levels, " ")
    process(levels, n)

    for (exclude_pos = 1; exclude_pos <= n; exclude_pos++) {
        copyArray(levels, n, level_copy, exclude_pos)
        process(level_copy, n - 1)
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

function process(arr, len) {
    printArray(arr, len)
}

function printArray(arr, len) {
    line = ""
    for (i = 1; i <= len; i++) {  # Iterate through indices from 1 to len
        if (line != "") line = line " " arr[i]
        else line = arr[i]
    }
    print line
}
