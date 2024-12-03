{
    process(1)
}
function process(damp){
    for (i = 1; i <= NF; i++) {
        arr[i] = $i
    }
    current=""
    direction=""
    safe=1
    for (i = 1; i<= NF; i++){
        if (current == ""){
            current = arr[i]
            continue
        }

        difference = abs(current - arr[i])
        if (difference > 3){
            safe=0
            print "unsafe - difference too large: " difference
            break
        }

        if (difference == 0){
            safe=0
            if (damp == 1){
                delete arr[i]
                $0 = joinArray(arr,NF-1, " ")
                return process(0)
            }
            print "unsafe - no difference"
            break
        }

        if (direction == ""){
            direction = arr[i] < current ? -1 : 1;
        }

        if (direction == -1 && arr[i] > current){
            safe=0
            if (damp == 1){
                delete arr[i]
                $0 = joinArray(arr,NF-1, " ")
                return process(0)
            }
            print "unsafe - increase after decrease " $0 " i=" $i
            break
        }

        if (direction == 1 && arr[i] < current){
            safe=0
            if (damp == 1){
                delete arr[i]
                $0 = joinArray(arr,NF-1, " ")
                return process(0)
            }
            print "unsafe - decrease after increase"
            break
        }

        current=arr[i]
    }

    if(safe==1){
        print "safe"
    }
}

function abs(x) {
    return (x < 0) ? -x : x
}

function joinArray(arr, n, sep,    i, result) {
    result = ""
    for (i = 1; i <= n; i++) {
        if (i in arr) {
            result = result (result == "" ? "" : sep) arr[i]
        }
    }
    return result
}