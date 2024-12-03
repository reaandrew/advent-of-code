{
    process(1)
}

function process(damp){
    current=""
    direction=""
    safe=1
    for (i = 1; i<= NF; i++){
        if (current == ""){
            current = $i
            continue
        }

        difference = abs(current - $i)
        if (difference > 3){
            safe=0
            print "unsafe - difference too large: " difference
            break
        }

        if (difference == 0){
            safe=0
            if (damp == 1){
                $0 = substr($0, 1, i - 1) substr($0, i + 2)
                return process(0)
            }
            print "unsafe - no difference"
            break
        }

        if (direction == ""){
            direction = $i < current ? -1 : 1;
        }

        if (direction == -1 && $i > current){
            safe=0
            print "unsafe - increase after decrease"
            break
        }

        if (direction == 1 && $i < current){
            safe=0
            if (damp == 1){
                $0 = substr($0, 1, i - 1) substr($0, i + 2)
                return process(0)
            }
            print "unsafe - decrease after increase"
            break
        }

        current=$i
    }

    if(safe==1){
        print "safe"
    }
}

function abs(x) {
    return (x < 0) ? -x : x
}