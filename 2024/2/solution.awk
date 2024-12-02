{
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

        current=$i
    }

    if(safe==1){
        print "safe"
    }
}
function abs(x) {
    return (x < 0) ? -x : x
}